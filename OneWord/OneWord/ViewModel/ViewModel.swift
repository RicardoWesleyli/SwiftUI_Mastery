//
//  ViewModel.swift
//  OneWord
//

import SwiftUI

class ViewModel: ObservableObject {
    var jsonURL: URL = URL(string: "https://api.npoint.io/c1475aeb0e6c6a43f4ea")!
    @Published var wordsArray: [String] = []
    // 初始化
    init() {
        getSentences()
    }
    // 网络请求-请求句子
    func getSentences() {
        let session = URLSession(configuration: .default)
        session.dataTask(with: jsonURL) { data, _, _ in
            guard let jsonData = data else { return }
            do {
                let sentences = try JSONDecoder().decode([SentenceModel].self, from: jsonData)
                DispatchQueue.main.async {
                    // 写入数组
                    for item in sentences {
                        self.wordsArray.append(item.sentence)
                        
                        // 写入共享数据
                        if let myDefaults = UserDefaults(suiteName: "group.mySentence") {
                            myDefaults.set(item.sentence, forKey: "textArray")
                         }
                    }
                }
            } catch {
                print(error)
            }
        }
        .resume()
    }
}
