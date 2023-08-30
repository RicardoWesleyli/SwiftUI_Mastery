//
//  ContentView.swift
//  OneWord
//

import SwiftUI

struct ContentView: View {
    // VM
    @StateObject var viewModel = ViewModel()

    var body: some View {
        VStack {
            ForEach(viewModel.wordsArray, id: \.self) { sentence in
                Text(sentence)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
