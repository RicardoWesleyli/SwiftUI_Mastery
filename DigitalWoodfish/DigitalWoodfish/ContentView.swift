//
//  ContentView.swift
//  DigitalWoodfish
//
//  Created by Ricardo Li on 2022/11/9.
//

import SwiftUI

struct ContentView: View {
    @State var gameType: String = "功德值"
    @State var totalNumber: Int = 0
    @State var number: Int = 1
    @State var isTap: Bool = false
    @State var showDetailView:Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.black)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    if isTap {
                        Text(gameType + "+" + String(number))
                    }
                    Image("woodfish")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 180, maxHeight: 180)
                        .scaleEffect(isTap ? 0.99 : 1.0)
                        .onTapGesture {
                            totalNumber += number

                            playAudio(forResource: "dong", ofType: "mp3")

                            if !isTap {
                                self.isTap.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    self.isTap.toggle()
                                }
                            }
                        }
                }
                .padding()
                .navigationTitle(gameType + "：" + String(totalNumber))
                .navigationBarItems(trailing: settingBtn())
                .preferredColorScheme(.dark)
                .sheet(isPresented: $showDetailView) {
                    DetailView(gameType: $gameType, totalNumber: $totalNumber, number: $number)
                }
            }
        }
    }

    func settingBtn() -> some View {
        Button(action: {
            self.showDetailView.toggle()
        }) {
            Image(systemName: "slider.horizontal.3")
                .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
