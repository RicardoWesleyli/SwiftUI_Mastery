//
//  ContentView.swift
//  DateFormatterView
//

import SwiftUI

struct ContentView: View {
    @State var currentTime: String = "00:00:00"
    @State var currentDate: String = "2023年4月27日"
    @State var currentWeek: String = "星期四"

    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var isLunar: Bool = false

    var body: some View {
        VStack(spacing: 32) {
            dateView
            timeView
            weekView
        }

        // 展示时
        .onAppear {
            currentTime = getCurrentTime("HH:mm:ss", false)
            currentDate = getCurrentTime("YYYY年MM月dd日", isLunar)
            currentWeek = getCurrentTime("EEEE", false)
        }

        // 监听变化
        .onReceive(timer) { _ in
            currentTime = getCurrentTime("HH:mm:ss", false)
            currentDate = getCurrentTime("YYYY年MM月dd日", isLunar)
            currentWeek = getCurrentTime("EEEE", false)
        }
    }

    // 展示日期
    private var dateView: some View {
        Text(currentDate)
            .font(.system(size: 17, design: .rounded))
            .bold()

            // 点击时
            .onTapGesture {
                self.isLunar.toggle()
            }
    }

    // 展示时间
    private var timeView: some View {
        Text(currentTime)
            .font(.system(size: 48, design: .rounded))
            .bold()
            .frame(maxWidth: .infinity, maxHeight: 120)
            .background(Color(.systemGray6))
            .cornerRadius(16)
            .padding(.horizontal)
    }

    // 展示星期
    private var weekView: some View {
        Text(currentWeek)
            .font(.system(size: 17, design: .rounded))
            .bold()
    }

    // 获得当前时间
    func getCurrentTime(_ time: String, _ isLunar: Bool) -> String {
        // 实例
        let formatter = DateFormatter()

        // 判断新历农历
        if isLunar {
            formatter.dateStyle = .long
            formatter.timeStyle = .none
            formatter.locale = Locale(identifier: "zh_CN")
            formatter.calendar = Calendar(identifier: .chinese)
        } else {
            formatter.locale = Locale(identifier: "zh_CN")
            formatter.dateFormat = time
        }

        // 返回日期字符串
        return formatter.string(from: Date())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
