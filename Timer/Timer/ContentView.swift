//
//  ContentView.swift
//  Timer
//
//  Created by Ricardo Li on 2022/7/27.
//

import SwiftUI

struct ContentView: View {
    @State var timeText: String = "0.00"
    @State var isPause: Bool = false
    @State var isStart: Bool = false
    @State private var startTime = Date()
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(spacing: 20) {
            titleView()
            dinnerImageView()
            timerTextView()
            Spacer()

            // 操作按钮
            if isStart {
                pauseAndResetBtn()
            } else {
                startBtn()
            }
        }
        .padding()
        .padding(.bottom, 40)
    }

    // 计时器标题
    func titleView() -> some View {
        HStack {
            Text("计时器")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
        }
    }

    // 图片
    func dinnerImageView() -> some View {
        Image("dinner")
            .resizable()
            .scaledToFit()
    }

    // 计时文字
    func timerTextView() -> some View {
        Text(timeText)
            .font(.system(size: 48))
            .padding(.horizontal)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .onReceive(timer) { _ in
                if self.isStart {
                    timeText = String(format: "%.2f", Date().timeIntervalSince(self.startTime))
                }
            }
    }

    // 开始按钮
    func startBtn() -> some View {
        ZStack {
            Circle()
                .frame(width: 60, height: 60)
                .foregroundColor(.green)
            Image(systemName: "play.fill")
                .foregroundColor(.white)
                .font(.system(size: 32))
        }.onTapGesture {
            self.isStart = true
            timeText = "0.00"
            startTime = Date()
            self.startTimer()
        }
    }

    // 暂停和复位按钮
    func pauseAndResetBtn() -> some View {
        HStack(spacing: 60) {
            // 暂停按钮
            ZStack {
                Circle()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.red)
                Image(systemName: isPause ? "play.fill" : "pause.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 32))
            }
            .onTapGesture {
                if !isPause {
                    self.isPause = true
                    self.stopTimer()
                } else {
                    self.isPause = false
                    self.startTimer()
                }
            }

            // 复位按钮
            ZStack {
                Circle()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.blue)
                Image(systemName: "arrow.uturn.backward.circle.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 32))
            }
            .onTapGesture {
                self.isStart = false
                self.isPause = false
                timeText = "0.00"
            }
        }
    }

    // 开始计时方法
    func startTimer() {
        timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    }

    // 停止计时方法
    func stopTimer() {
        timer.upstream.connect().cancel()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
