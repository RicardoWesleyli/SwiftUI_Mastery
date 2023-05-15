//
//  CustomTabBar.swift
//  SwiftUIGradient
//
//  Created by Ricardo Li on 2022/6/30.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: String
    @State var tabPoints: [CGFloat] = []

    var body: some View {
        HStack(spacing: 0) {
            TabBarButton(image: Constants.homeIcon, selectedTab: $selectedTab, tabPoints: $tabPoints)
            TabBarButton(image: Constants.searchIcon, selectedTab: $selectedTab, tabPoints: $tabPoints)
//            TabBarButton(image: Constants.likeIcon, selectedTab: $selectedTab, tabPoints: $tabPoints)
            TabBarButton(image: Constants.mineIcon, selectedTab: $selectedTab, tabPoints: $tabPoints)
        }
        .padding()
        .background(
            Color.white
                .clipShape(TabCurve(tabPoint: curvePoint - 15))
        )
        .overlay(
            Circle()
                .fill(Color.gray)
                .frame(width: 10, height: 10)
                .offset(x: curvePoint - 20)
            , alignment: .bottomLeading
        )
        .cornerRadius(30)
        .padding(.horizontal)
    }

    var curvePoint: CGFloat {
        if tabPoints.isEmpty {
            return 10
        } else {
            switch selectedTab {
            case Constants.homeIcon:
                return tabPoints[0]
            case Constants.searchIcon:
                return tabPoints[1]
//            case Constants.likeIcon:
//                return tabPoints[2]
            default:
                return tabPoints[2]
            }
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        GradientView()
    }
}

struct TabBarButton: View {
    var image: String
    @Binding var selectedTab: String
    @Binding var tabPoints: [CGFloat]

    var body: some View {
        GeometryReader { reader -> AnyView in
            let midX = reader.frame(in: .global).midX

            DispatchQueue.main.async {
                if tabPoints.count <= 4 {
                    tabPoints.append(midX)
                }
            }
            return AnyView(
                Button(action: {
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.5)) {
                        selectedTab = image
                    }
                }, label: {
                    Image(systemName: "\(image)\(selectedTab == image ? ".fill" : "")")
                        .font(.system(size: 32, weight: .semibold))
                        .foregroundColor(Color.gray)
                        .offset(y: selectedTab == image ? -10 : 0)
                })
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            )
        }
        .frame(height: 50)
    }
}
