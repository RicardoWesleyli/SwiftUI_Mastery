//
//  ProductModel.swift
//  Chapter13
//

import SwiftUI

struct ProductModel: Identifiable {
    var id: UUID = UUID()
    var productImage: String
    var productName: String
    var size: String
    var price: Int
}

var productModels = [
    ProductModel(productImage: "Coffee1", productName: "生椰半熟芝士拿铁", size: "标准/冰/半糖", price: 17),
    ProductModel(productImage: "Coffee2", productName: "开心果燕麦拿铁", size: "标准/冰/半糖", price: 22),
    ProductModel(productImage: "Coffee3", productName: "白桃芝士拿铁", size: "标准/冰/半糖", price: 23),
    ProductModel(productImage: "Coffee4", productName: "桂花拿铁", size: "标准/冰/半糖", price: 13),
    ProductModel(productImage: "Coffee5", productName: "燕麦拿铁", size: "标准/冰/半糖", price: 17)
]
