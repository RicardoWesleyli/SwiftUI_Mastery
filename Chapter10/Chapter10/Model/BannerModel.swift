//
//  BannerModel.swift
//  Chapter10
//

import SwiftUI

struct BannerModel: Identifiable {
    var id: UUID = UUID()
    var imageName: String
}

//示例数据
var bannerModels = (1...8).map { BannerModel(imageName: "BannerImage\($0)") }
