//
//  Model.swift
//  OneWord
//

import SwiftUI

struct SentenceModel: Hashable, Codable, Identifiable {
    var id: Int
    var sentence: String
}
