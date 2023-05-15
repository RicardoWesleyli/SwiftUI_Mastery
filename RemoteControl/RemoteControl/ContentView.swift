//
//  ContentView.swift
//  RemoteControl
//
//  Created by Ricardo Li on 2022/8/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 32) {
            imageBtnView(image: "power", imageColor: .red)
            imageBtnView(image: "mic", imageColor: .white)

            mainBtnView()

            HStack(spacing: 32) {
                imageBtnView(image: "house", imageColor: .white)
                imageBtnView(image: "arrow.uturn.backward", imageColor: .white)
                imageBtnView(image: "slider.horizontal.3", imageColor: .white)
            }
            volumeBtnView()

            Spacer()
        }
        .padding()
        .padding(.top, 40)
        .frame(maxHeight: .infinity)
        .background(Color(red: 51 / 255, green: 51 / 255, blue: 51 / 255))
        .cornerRadius(16)
    }

    // 上下左右按钮
    func mainBtnView() -> some View {
        Circle()
            .fill(Color(red: 66 / 255, green: 66 / 255, blue: 66 / 255))
            .frame(width: 190, height: 190)
            .overlay(Circle().stroke(Color.black, lineWidth: 6))
            .overlay {
                Button(action: {
                }) {
                    Circle()
                        .fill(Color(red: 66 / 255, green: 66 / 255, blue: 66 / 255))
                        .frame(width: 100, height: 100)
                        .overlay(Circle().stroke(Color.black, lineWidth: 6))
                }
            }
    }

    // 音量按钮
    func volumeBtnView() -> some View {
        VStack(spacing: 100) {
            Button(action: {
            }) {
                Image(systemName: "plus")
                    .font(.system(size: 17))
                    .foregroundColor(.white)
            }
            Button(action: {
            }) {
                Image(systemName: "minus")
                    .font(.system(size: 17))
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(Color(red: 66 / 255, green: 66 / 255, blue: 66 / 255))
        .cornerRadius(32)
        .overlay(RoundedRectangle(cornerRadius: 32).stroke(Color.black, lineWidth: 4))
    }
}

// 按钮复用视图
struct imageBtnView: View {
    var image: String
    var imageColor: Color

    var body: some View {
        Button(action: {
        }) {
            Image(systemName: image)
                .foregroundColor(imageColor)
                .font(.system(size: 17))
                .frame(width: 40, height: 40)
                .background(Color(red: 66 / 255, green: 66 / 255, blue: 66 / 255))
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 4))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
