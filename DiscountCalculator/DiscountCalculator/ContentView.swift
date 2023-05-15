//
//  ContentView.swift
//  DiscountCalculator
//
//  Created by Ricardo Li on 2022/8/1.
//

import SwiftUI

struct ContentView: View {
    @State var priceStr = ""
    @State var finalPrice = "0.00"
    @State var discountType = ["买一送一", "买三送一", "第二瓶半价", "加一元多一件"]
    @State var finalDiscount = ""

    var body: some View {
        VStack {
            titleView()
            priceInput()
            priceOutput()
            Spacer()
            discountEvent()
            Spacer()
        }
        .padding()
        .onTapGesture {
            self.hideKeyboard()
        }
    }

    // 标题
    func titleView() -> some View {
        HStack {
            Text("折扣计算器")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
        }
    }

    // 价格输入
    func priceInput() -> some View {
        TextField("0.00", text: $priceStr)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .font(Font.system(size: 30))
            .disableAutocorrection(true)
            .keyboardType(.numberPad)
            .multilineTextAlignment(.trailing)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 60)
            .onChange(of: priceStr) { _ in
                if priceStr != "" {
                    finalPrice = calculate()
                } else {
                    finalPrice = "0.00"
                }
            }
    }

    // 最终价格输出
    func priceOutput() -> some View {
        Text("折扣价：" + finalPrice)
            .font(.system(size: 23))
    }

    // 折扣活动
    func discountEvent() -> some View {
        VStack(spacing: 10) {
            ForEach(discountType.indices, id: \.self) { item in
                Text(discountType[item])
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 40)
                    .background(Color(red: 51 / 255, green: 51 / 255, blue: 51 / 255))
                    .foregroundColor(.white)
                    .cornerRadius(4)
                    .onTapGesture {
                        finalDiscount = discountType[item]
                        finalPrice = calculate()
                    }
            }
        }
    }

    // 计算方法
    func calculate() -> String {
        if finalDiscount == "" {
            finalPrice = priceStr
        } else if finalDiscount == "买一送一" {
            finalPrice = String(priceStr.toFloat / 2)
        } else if finalDiscount == "买三送一" {
            finalPrice = String(priceStr.toFloat * 3 / 4)
        } else if finalDiscount == "第二瓶半价" {
            finalPrice = String(priceStr.toFloat * 0.75)
        } else if finalDiscount == "加一元多一件" {
            finalPrice = String((priceStr.toFloat + 1) / 2)
        }

        return finalPrice
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension String {
    var toFloat: Float {
        return Float(self) ?? 0
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}
