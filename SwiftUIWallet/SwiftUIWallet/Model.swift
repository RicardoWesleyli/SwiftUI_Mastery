//
//  Model.swift
//  SwiftUIWallet
//
//  Created by Ricardo Li on 2022/7/7.
//

import SwiftUI

struct Model: Identifiable {
    var id = UUID()
    var cardBGColor: Color
}

var sampleModels = [
    Model(cardBGColor: Color.Hex(0xF8B5C1)),
    Model(cardBGColor: Color.Hex(0xF8D0D2)),
    Model(cardBGColor: Color.Hex(0xEFF2F8)),
    Model(cardBGColor: Color.Hex(0x2B92E4))
]
