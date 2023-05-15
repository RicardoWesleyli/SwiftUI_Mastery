//
//  AboutView.swift
//  ColourAtla
//
//  Created by Ricardo Li on 2022/7/8.
//

import SwiftUI

struct AboutView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack{
                Divider()
                Spacer()
            }
            .navigationBarTitle(Text(Constants.aboutViewName), displayMode: .inline)
            .navigationBarItems(trailing: closeBtnView)
        }
    }
    
    // MARK: - 关闭

    private var closeBtnView: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: Constants.clearButton)
                .foregroundColor(Color.gray)
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
