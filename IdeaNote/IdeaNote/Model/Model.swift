//
//  Model.swift
//  IdeaNote
//
//  Created by Ricardo Li on 2022/9/17.
//

import Foundation
import SwiftUI

struct NoteModel: Identifiable,Codable{
    var id = UUID()
    var writeTime: String
    var title: String
    var content: String
}
