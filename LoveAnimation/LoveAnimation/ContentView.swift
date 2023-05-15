//
//  ContentView.swift
//  LoveAnimation
//
//  Created by Ricardo Li on 2022/7/16.
//

import SwiftUI

struct ContentView: View {
    @State var loveCount = 0

    func TapAction() {
        loveCount += 1
    }

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(alignment: .center, spacing: 40) {
                ZStack {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 120, height: 120)
                        .padding()
                        .onTapGesture {
                            TapAction()
                        }

                    ForEach(0 ..< loveCount, id: \.self) { _ in
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .modifier(LoveTapModifier())
                            .padding()
                    }
                }

                Text("我喜欢你")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
