//
//  ViewModel.swift
//  MyMenu
//
//  Created by Ricardo Li on 2022/7/21.
//

import SwiftUI

class ViewModel: ObservableObject {
    // 当前餐段
    @Published var currentTimeName: String = ""
    @Published var currentImageURL: String = ""
    @Published var currentName: String = ""
    @Published var models: [Model] = []
    let DataURL = "https://api.npoint.io/4e97acfc3e5f73300779"

    init() {
        updateTime()
        getMenu()
    }

    // 餐段枚举
    enum MealTimeName: String {
        case breakfast = "早餐"
        case lunch = "午餐"
        case afternoonTea = "下午茶"
        case supper = "晚餐"
        case nightSnack = "宵夜"
    }

    // 获取当前系统时间
    func getCurrentTime() -> Int {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "HH"
        return Int(dateformatter.string(from: Date()))!
    }

    // 更新当前餐段
    func updateTime() {
        if getCurrentTime() < 10 {
            currentTimeName = MealTimeName.breakfast.rawValue
        } else if getCurrentTime() >= 10 && getCurrentTime() < 14 {
            currentTimeName = MealTimeName.lunch.rawValue
        } else if getCurrentTime() >= 14 && getCurrentTime() < 16 {
            currentTimeName = MealTimeName.afternoonTea.rawValue
        } else if getCurrentTime() >= 16 && getCurrentTime() < 20 {
            currentTimeName = MealTimeName.supper.rawValue
        } else {
            currentTimeName = MealTimeName.nightSnack.rawValue
        }
    }

    // 网络请求
    func getMenu() {
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: DataURL)!) { data, _, _ in
            guard let jsonData = data else { return }
            do {
                let meals = try JSONDecoder().decode([Model].self, from: jsonData)
                self.models = meals
            } catch {
                print(error)
            }
        }
        .resume()
    }

    // 根据餐段获得餐品信息
    func getMealMessage(time:String) {
        let query = time.lowercased()
        DispatchQueue.global(qos: .background).async {
            let filter = self.models.filter { $0.foodTime.lowercased().contains(query) }

            DispatchQueue.main.async {
                withAnimation(.spring()) {
                    self.models = filter
                }
            }
        }
    }
    
    //随机推荐菜品
    func getRandomFood() {
        let index = Int(arc4random() % UInt32(models.count))
        currentName = models[index].foodName
        currentImageURL = models[index].foodImageURL
    }
}
