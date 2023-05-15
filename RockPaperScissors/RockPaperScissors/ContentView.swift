//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Ricardo Li on 2022/7/28.
//

import SwiftUI

struct ContentView: View {
    @State var gameTimes: Int = 1
    @State var ruleName: String = "一局定胜负"
    @State var computerPushImage: String = "game"
    @State var gameModels = ["rock", "paper", "scissors"]
    @State var selectedImage: String = ""
    @State var isSelected: Bool = false

    @State var gameTotal: Int = 1
    @State var computerWinCount: Int = 0
    @State var winName: String = ""
    @State var winMessage: String = ""
    @State var isShowWinner: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            titleView()
            ruleView()
            computerPush()
            Spacer()
            Spacer()
            if isSelected {
                personPush()
            } else {
                personSelected()
            }
            Spacer()
            playGame()
        }
        .padding()
        .alert(isPresented: $isShowWinner) {
            showResult()
        }
    }

    // 标题
    func titleView() -> some View {
        HStack {
            Text("剪刀石头布")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            Spacer()
        }
    }

    // 规则
    func ruleView() -> some View {
        Menu {
            Button("一局定胜负") {
                self.gameTimes = 1
                self.ruleName = "一局定胜负"
                self.gameTotal = 1
            }
            Button("三局两胜") {
                self.gameTimes = 3
                self.ruleName = "三局两胜"
                self.gameTotal = 3
            }
            Button("五局三胜") {
                self.gameTimes = 5
                self.ruleName = "五局三胜"
                self.gameTotal = 5
            }
        } label: {
            Label(ruleName, systemImage: "slider.horizontal.3")
                .foregroundColor(.gray)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 10, maxHeight: 60)
                .background(Color(.systemGray6))
                .cornerRadius(8)
        }
    }

    // 系统出牌
    func computerPush() -> some View {
        Image(computerPushImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300)
            .clipShape(Circle())
    }

    // 用户可选牌
    func personSelected() -> some View {
        HStack {
            ForEach(gameModels.indices, id: \.self) { item in
                Image(gameModels[item])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80)
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedImage = gameModels[item]
                        self.isSelected = true
                    }
            }.frame(minWidth: 0, maxWidth: .infinity)
        }
    }

    // 用户出牌
    func personPush() -> some View {
        Image(selectedImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 120)
            .clipShape(Circle())
            .onTapGesture {
                self.isSelected = false
            }
    }

    // 立即猜拳
    func playGame() -> some View {
        Text("立即猜拳")
            .font(.system(size: 17))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 10, maxHeight: 32)
            .padding()
            .foregroundColor(.white)
            .background(Color(red: 51 / 255, green: 51 / 255, blue: 51 / 255))
            .cornerRadius(8)
            .onTapGesture {
                if isSelected {
                    randomPush()
                    showWinner()
                }
            }
    }

    // 随机猜拳方法
    func randomPush() {
        let index = Int.random(in: 0 ... 2)
        computerPushImage = gameModels[index]
        gameTimes -= 1
    }

    // 判断最终猜拳结果
    func showWinner() {
        if computerPushImage == "rock" && selectedImage == "paper" || computerPushImage == "paper" && selectedImage == "scissors" || computerPushImage == "scissors" && selectedImage == "rock" {
            winName = "你输了"
            computerWinCount += 1
            winMessage = "你还有" + String(gameTimes) + "次机会"
            isEndGame()
        } else if computerPushImage == selectedImage {
            gameTimes += 1
            winName = "平手"
            winMessage = "你还有" + String(gameTimes) + "次机会"
            isEndGame()
        } else {
            winName = "你赢了"
            winMessage = "你还有" + String(gameTimes) + "次机会"
            isEndGame()
        }
    }

    // 判断游戏是否结束
    func isEndGame() {
        if gameTimes == 0 {
            if gameTotal == 5 && computerWinCount == 3 || gameTotal == 3 && computerWinCount == 2 || gameTotal == 1 && computerWinCount == 1 {
                computerWinCount = 0
                gameTimes = gameTotal
                winName = "计算机赢了"
                winMessage = "游戏结束"
                isShowWinner = true
            } else {
                computerWinCount = 0
                gameTimes = gameTotal
                winName = "你赢了"
                winMessage = "游戏结束"
                isShowWinner = true
            }
        } else {
            isShowWinner = true
        }
    }

    // 展示猜拳结果
    func showResult() -> Alert {
        let alert = Alert(
            title: Text(winName),
            message: Text(winMessage),
            dismissButton: .default(Text("继续")) {
                self.computerPushImage = "game"
                self.isSelected = false
            }
        )
        return alert
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
