//
//  SwiftUIDataFlow.swift
//  Chapter16
//

import SwiftUI

struct SwiftUIDataFlow: View {
    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
        Toggle(isOn: $viewModel.useFaceID) {
            Text(viewModel.useFaceID ? "开启" : "关闭")
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .padding(.horizontal)
    }
}

struct SwiftUIDataFlow_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIDataFlow()
            .environmentObject(ViewModel())
    }
}
