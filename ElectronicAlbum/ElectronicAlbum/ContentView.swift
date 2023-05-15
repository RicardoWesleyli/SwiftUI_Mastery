//
//  ContentView.swift
//  ElectronicAlbum
//
//  Created by Ricardo Li on 2022/8/5.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            imageCardView()
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .background(Color(red: 254 / 255, green: 207 / 255, blue: 238 / 255)).edgesIgnoringSafeArea(.all)
    }

    // 图片视图
    func imageCardView() -> some View {
        ForEach(models) { item in
            GeometryReader { innerView in
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .shadow(color: .pink, radius: 5, x: 0, y: 0)
                    .frame(width: innerView.frame(in: .global).width, height: innerView.frame(in: .global).height)
                    .rotation3DEffect(Angle(degrees: getAngle(xOffset: innerView.frame(in: .global).minX)),
                                      axis: (x: 0.0, y: 1.0, z: 0.0),
                                      anchor: innerView.frame(in: .global).minX > 0 ? .leading : .trailing,
                                      perspective: 2.5
                    )

            }
        }
    }

    func getAngle(xOffset: CGFloat) -> Double {
        let tempAngle = xOffset / (UIScreen.main.bounds.width / 2)
        let rotationDegree: CGFloat = 30
        return Double(tempAngle * rotationDegree)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
