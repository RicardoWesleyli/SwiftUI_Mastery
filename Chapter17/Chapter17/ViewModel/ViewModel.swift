//
//  ViewModel.swift
//  Chapter17
//

import SwiftUI

class ViewModel: ObservableObject {
    let jsonURL = "https://api.npoint.io/2f39b247be09ccfd797d"
    @Published var colors: [ColorModel] = []

    // 初始化
    init() {
        requestData()
    }

    // 网络请求
    func requestData() {
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: jsonURL)!) { data, _, _ in
            guard let jsonData = data else { return }

            do {
                let datas = try JSONDecoder().decode([ColorModel].self, from: jsonData)
                DispatchQueue.main.async {
                    self.colors = datas
                }
            } catch {
                print(error)
            }
        }
        .resume()
    }
    
    //    // 解析JSON数据
    //    func getData() {
    //        if let url = Bundle.main.url(
    //            forResource: "colors",
    //            withExtension: "json"
    //        ) {
    //            do {
    //                let data = try Data(contentsOf: url)
    //                let decoder = JSONDecoder()
    //
    //                // 解析数据后赋值
    //                colors = try decoder.decode([ColorModel].self, from: data)
    //            } catch {
    //                // 处理错误
    //            }
    //        } else {
    //            // 文件不存在
    //        }
    //    }
}
