//
//  ContentView.swift
//  OneWord
//
//

import SwiftUI

// Model
struct SentenceModel: Hashable, Codable, Identifiable {
    var id: Int
    var sentence: String
}

// View
struct ContentView: View {
    // VM
    @StateObject var viewModel = ViewModel()

    var body: some View {
        VStack {
            ForEach(viewModel.wordsArray, id: \.self) { sentence in
                Text(sentence)
                    .padding()
                    .frame(maxWidth:.infinity)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

// ViewModel
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
                    
                    for item in sentences {
                        // 写入数组
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
