//
//  Model.swift
//  DataPersistence
//
//  Created by Ricardo Li on 2023/3/30.
//

import SwiftUI

struct NoteModel: Identifiable, Codable {
    var id: UUID = UUID()
    var content: String
    var updateTime: String
}
