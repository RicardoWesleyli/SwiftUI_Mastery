//
//  Model.swift
//  Chapter18
//

import SwiftUI

struct NoteModel: Identifiable, Codable {
    var id: UUID = UUID()
    var content: String
    var updateTime: String
}
