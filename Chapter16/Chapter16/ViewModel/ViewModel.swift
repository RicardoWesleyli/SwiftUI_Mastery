//
//  ViewModel.swift
//  Chapter16
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var inputText: String = ""
    @Published var showDataFlowDetailView: Bool = false
    
    @AppStorage("useFaceID") var useFaceID: Bool = false
}
