//
//  CoffeeModel.swift
//  Chapter13
//

import SwiftUI

struct CoffeeModel: Identifiable {
    var id: UUID = UUID()
    var imageName: String
}

//示例数据
var coffeeModels = (1...5).map { CoffeeModel(imageName: "CoffeeImage\($0)") }
