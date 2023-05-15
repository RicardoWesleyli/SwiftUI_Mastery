//
//  DetailView.swift
//  DigitalWoodfish
//
//  Created by Ricardo Li on 2022/11/9.
//

import SwiftUI

struct DetailView: View {
    @Binding var gameType: String
    @Binding var totalNumber: Int
    @Binding var number: Int
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationStack{
            Form {
                TextField("请输入内容", text: $gameType)
                Stepper(value: $totalNumber, in: 0 ... 9999) {
                    Text(gameType + "：" + "\(totalNumber)")
                }
                Stepper(value: $number, in: 1 ... 9999) {
                    Text(gameType + " + " + "\(number)")
                }
            }
            .navigationBarTitle("编辑内容", displayMode: .inline)
            .navigationBarItems(trailing: closeBtn())
        }
    }
    
    func closeBtn() -> some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.circle.fill")
                .foregroundColor(.white)
            }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(gameType: .constant(""), totalNumber: .constant(0), number: .constant(0))
    }
}
