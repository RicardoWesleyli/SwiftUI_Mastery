//
//  ContentView.swift
//  SwiftUIStyleSheet
//
//  Created by Ricardo Li on 2022/8/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing:15){
            Text("文如秋雨")
                .mainTitle()
            Text("文如秋雨")
                .mainTitle()
            Text("文如秋雨")
                .mainTitle()
            Text("文如秋雨")
                .mainTitle()
        }
    }
}

struct MainTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth:.infinity)
            .font(.system(size: 17))
            .foregroundColor(.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(8)
            .padding(.horizontal)
    }
}

extension View {
    func mainTitle() -> some View {
        self.modifier(MainTitle())
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

