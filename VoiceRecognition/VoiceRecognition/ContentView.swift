//
//  ContentView.swift
//  VoiceRecognition
//
//  Created by Ricardo Li on 2022/7/8.
//

import AVFoundation
import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var longPressTap = false
    @GestureState private var islongPress = false

    var body: some View {
        VStack {
            Spacer()

            // MARK: 文字展示区域

            ZStack(alignment: .topLeading) {
                TextEditor(text: $message)
                    .frame(maxWidth: .infinity, maxHeight: 150)
                    .lineSpacing(10.0)
                    .multilineTextAlignment(.leading)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(UIColor.placeholderText), lineWidth: 1)
                    )

                if message.isEmpty {
                    Text("长按识别")
                        .font(.system(size: 17))
                        .foregroundColor(Color(UIColor.placeholderText))
                        .padding(8)
                }
            }.padding()

            Spacer()

            // MARK: 语音识别按钮

            Image(systemName: islongPress ? "waveform.circle.fill" : "waveform.circle")
                .font(.system(size: 68))
                .foregroundColor(islongPress ? Color.blue : Color.gray)
                .padding(.bottom, 20)
                .onTapGesture {
                    VoiceRecognition()
                }
//                .gesture(longPress)
        }
    }

    // MARK: 长按手势

    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 1)
            .updating($islongPress) { currentState, gestureState,
                _ in
                gestureState = currentState
                VoiceRecognition()
            }
            .onEnded { finished in
                self.longPressTap = finished
            }
    }

    // MARK: 语音识别方法

    func VoiceRecognition() {
        let utterance = AVSpeechUtterance(string: message)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
