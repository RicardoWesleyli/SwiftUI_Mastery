//
//  Model.swift
//  ElectronicAlbum
//
//  Created by Ricardo Li on 2022/8/5.
//

import SwiftUI

struct Model:Identifiable {
    var id = UUID()
    var imageName: String
}

var models = (1...6).map { Model(imageName:"\($0)") }

