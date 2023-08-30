//
//  TextToSpeech.swift
//  Chapter22
//

import SwiftUI
import AVFoundation

struct TextToSpeech: View {
    @State var inputText: String = ""
    let synthesizer = AVSpeechSynthesizer()

    var body: some View {
        VStack {
            textInputView
            textToSpeechBtn
        }
    }

    // 文字输入文本框
    private var textInputView: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $inputText)
                .padding()

            if inputText.isEmpty {
                Text("请输入文字内容")
                    .foregroundColor(Color(UIColor.placeholderText))
                    .padding(25)
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(.systemGray5), lineWidth: 1)
        )
        .padding()
        .frame(height: 320)
    }

    // 文字转语音按钮
    private var textToSpeechBtn: some View {
        Button(action: {
            // 点击播放声音
            speak(inputText)
        }) {
            Text("语音播放")
                .font(.system(size: 17))
                .foregroundColor(.white)
                .padding()
                .frame(width: 320)
                .background(Color.blue)
                .cornerRadius(8)
        }
    }
    
    // 文字转语音方法
    func speak(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        utterance.pitchMultiplier = 1.2
        utterance.volume = 1.0
        synthesizer.speak(utterance)
    }
}

struct TextToSpeech_Previews: PreviewProvider {
    static var previews: some View {
        TextToSpeech()
    }
}
