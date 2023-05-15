//
//  SpeechManager.swift
//  VoiceRecognition
//
//  Created by Ricardo Li on 2022/7/9.
//

import SwiftUI
import Speech

enum LGSpeechType: Int {
    case start
    case stop
    case finished
    case authDenied
}

typealias LGSpeechBlock = (_ speechType: LGSpeechType, _ finalText: String?) -> Void

@available(iOS 10.0, *)

class LGSpeechManager: NSObject {

    private var parentVc: UIViewController!
    private var speechTask: SFSpeechRecognitionTask?
    // 声音处理器
    private var speechRecognizer: SFSpeechRecognizer?
    
    static let share = LGSpeechManager()
    
    private var block: LGSpeechBlock?
    
    // 语音识别器
    lazy var recognitionRequest: SFSpeechAudioBufferRecognitionRequest = {
        let recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        return recognitionRequest
    }()
    
 
    
    lazy var audioEngine: AVAudioEngine = {
        let audioEngine = AVAudioEngine()
        audioEngine.inputNode.installTap(onBus: 0, bufferSize: 1024, format: audioEngine.inputNode.outputFormat(forBus: 0)) { (buffer, audioTime) in
            // 为语音识别请求对象添加一个AudioPCMBuffer，来获取声音数据
            self.recognitionRequest.append(buffer)
        }
        return audioEngine
    }()
    
    
    func lg_startSpeech(speechVc: UIViewController, langugeSimple: String, speechBlock: @escaping LGSpeechBlock) {
        parentVc = speechVc
        block = speechBlock
        
        lg_checkmicroPhoneAuthorization { (microStatus) in
            if microStatus {
                self.lg_checkRecognizerAuthorization(recongStatus: { (recStatus) in
                    if recStatus {
                        //  初始化语音处理器的输入模式 语音处理器准备就绪（会为一些audioEngine启动时所必须的资源开辟内存）
                        self.audioEngine.prepare()
                        if (self.speechTask?.state == .running) {   // 如果当前进程状态是进行中
                            // 停止语音识别
                           self.lg_stopDictating()
                        } else {   // 进程状态不在进行中
                            self.speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: langugeSimple))
                            guard (self.speechRecognizer != nil) else {
                                self.showAlert("抱歉，暂不支持当前地区使用语音输入")
                                return
                            }
                            self.lg_setCallBack(type: .start, text: nil)
                            // 开启语音识别
                            self.lg_startDictating()
                        }
                    } else {
                        self.showAlert("您已取消授权使用语音识别，如果需要使用语音识别功能，可以到设置中重新开启！")
                        self.lg_setCallBack(type: .authDenied, text: nil)
                    }
                })
            } else {
                //麦克风没有授权
                self.showAlert("您已取消授权使用麦克风，如果需要使用语音识别功能，可以到设置中重新开启！")
                self.lg_setCallBack(type: .authDenied, text: nil)
            }
        }
    }
}


@available(iOS 10.0, *)
extension LGSpeechManager: SFSpeechRecognitionTaskDelegate {
    
    //判断语音识别权限
    private func lg_checkRecognizerAuthorization(recongStatus: @escaping (_ resType: Bool) -> Void) {
        let authorStatus = SFSpeechRecognizer.authorizationStatus()
        if authorStatus == .authorized {
            recongStatus(true)
        } else if authorStatus == .notDetermined {
            SFSpeechRecognizer.requestAuthorization { (status) in
                if status == .authorized {
                    recongStatus(true)
                } else {
                    recongStatus(false )
                }
            }
        } else {
            recongStatus(false)
        }
    }
    
    //检测麦克风
    private func lg_checkmicroPhoneAuthorization(authoStatus: @escaping (_ resultStatus: Bool) -> Void) {
        let microPhoneStatus = AVCaptureDevice.authorizationStatus(for: .audio)

        if microPhoneStatus == .authorized {
            authoStatus(true)
        } else if microPhoneStatus == .notDetermined {
            AVCaptureDevice.requestAccess(for: .audio, completionHandler: {(res) in
                if res {
                    authoStatus(true)
                } else {
                    authoStatus(false)
                }
            })
        } else {
            authoStatus(false)
        }
    }
    
    //开始进行
    private func lg_startDictating() {
        do {
            try audioEngine.start()
            speechTask = speechRecognizer!.recognitionTask(with: recognitionRequest) { (speechResult, error) in
                // 识别结果，识别后的操作
                if speechResult == nil {
                    return
                }
                self.lg_setCallBack(type: .finished, text: speechResult!.bestTranscription.formattedString)
            }
        } catch  {
            print(error)
            self.lg_setCallBack(type: .finished, text: nil)
        }
    }
    
    // 停止声音处理器，停止语音识别请求进程
    func lg_stopDictating() {
        lg_setCallBack(type: .stop, text: nil)
        audioEngine.stop()
        recognitionRequest.endAudio()
        speechTask?.cancel()
    }
    
    private func lg_setCallBack(type: LGSpeechType, text: String?) {
        if block != nil {
            block!(type, text)
        }
    }
    
    private func showAlert(_ message: String) {
        let alertVC = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let firstAction = UIAlertAction(title: "知道了", style: .default, handler: {(action) in
        })
        alertVC.addAction(firstAction)
        parentVc.present(alertVC, animated: true, completion: nil)
    }
}

