//
//  ContentView.swift
//  SwiftUIMGE
//
//  Created by Ricardo Li on 2022/8/22.
//

import SwiftUI

struct ContentView: View {
    @Namespace private var Transition
    @State var isSwitch: Bool = true

    var body: some View {
        if isSwitch {
            HStack {
                Spacer()
                Text("广州")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .matchedGeometryEffect(id: "guangzhou", in: Transition)
                Spacer()
                Image(systemName: "paperplane.circle")
                    .foregroundColor(.red)
                    .font(.title)
                    .onTapGesture {
                        withAnimation(.linear) {
                            self.isSwitch.toggle()
                        }
                    }
                Spacer()
                Text("北京")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .matchedGeometryEffect(id: "beijing", in: Transition)

                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding()
            
        } else {
            HStack {
                Spacer()
                Text("北京")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .matchedGeometryEffect(id: "beijing", in: Transition)
                Spacer()
                Image(systemName: "paperplane.circle")
                    .foregroundColor(.red)
                    .font(.title)
                    .onTapGesture {
                        withAnimation(.linear) {
                            self.isSwitch.toggle()
                        }
                    }
                Spacer()
                Text("广州")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .matchedGeometryEffect(id: "guangzhou", in: Transition)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
