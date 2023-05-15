//
//  OneWordWidget.swift
//  OneWordWidget
//
//

import WidgetKit
import SwiftUI
import Intents

//struct Provider: IntentTimelineProvider {
//    func placeholder(in context: Context) -> SimpleEntry {
//        SimpleEntry(date: Date(),
//                    configuration: ConfigurationIntent(),
//                    sentence: "每日推荐精选文字。"
//        )
//    }
//
//    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
//        let entry = SimpleEntry(date: Date(),
//                                configuration: configuration,
//                                sentence: "每日推荐精选文字。"
//        )
//        completion(entry)
//    }
//
//    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
//        var entries: [SimpleEntry] = []
//
//        // 声明数组
//        var sentences: [String] = []
//
//        // 读取共享数据
//        if let myDefaults = UserDefaults(suiteName: "group.mySentence") {
//            sentences = myDefaults.object(forKey: "textArray") as! [String]
//        }
//
//        // 单例
//        var sentence: String = ""
//        let currentDate = Date()
//        let entryDate = Calendar.current.date(byAdding: .minute, value: 15, to: currentDate)!
//
//        let errorSentence = "网络似乎出了点问题，请稍后重试"
//
//        // 判断文字数据是否为空
//        if sentences.isEmpty {
//            sentence = errorSentence
//        } else {
//            let index = Int(arc4random() % UInt32(sentences.count))
//            sentence = sentences[index]
//        }
//
//        // 更新文字到到entry中
//        let entry = SimpleEntry(date: entryDate, configuration: configuration, sentence: sentence)
//        entries.append(entry)
//
//        let timeline = Timeline(entries: entries, policy: .atEnd)
//        completion(timeline)
//    }
//}

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
//    let sentence: String
}

struct OneWordWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        Text("坦然面对生活的寂静。")
    }
}

struct OneWordWidget: Widget {
    let kind: String = "OneWordWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            OneWordWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("每日一句")
        .description("每日推荐精选文字。")
        .supportedFamilies([.systemMedium])
    }
}

//struct OneWordWidget_Previews: PreviewProvider {
//    static var previews: some View {
//        OneWordWidgetEntryView(
//            entry: SimpleEntry(date: Date(),
//            configuration: ConfigurationIntent(),
//            sentence: "坦然面对生活的寂静。")
//        )
//            .previewContext(WidgetPreviewContext(family: .systemMedium))
//    }
//}
