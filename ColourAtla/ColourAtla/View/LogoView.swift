//
//  LogoView.swift
//  ColourAtla
//
//  Created by Ricardo Li on 2022/7/9.
//

import SwiftUI

struct LogoView: View {
    @State var logoImage: String = "applelogo"
    @State var logoColor: Color = Color(.black)
    @State var bgColor: Color = Color(.systemGray6)

    private var segmentTitle = ["背景色", "图标", "填充色"]
    @State var selectedSegment: Int = 0

    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @State var cardItems: [CardModel] = []

    private var appleSymbols = ["house.circle", "person.circle", "bag.circle", "location.circle", "bookmark.circle", "gift.circle", "globe.asia.australia.fill", "lock.circle", "pencil.circle", "link.circle"]

    @State var showChooseImageSheet: Bool = false
    @State var showImagePicker: Bool = false
    @State var image: UIImage?

    var body: some View {
        VStack(spacing: 60) {
            HStack {
                LogoTitleView
                Spacer()
            }
            .padding()
            Spacer()

            if image != nil {
                ShowImageView
            } else {
                ShowLogoView
            }

            Spacer()

            // 选项卡
            VStack(spacing: -10) {
                SegmentView
                if selectedSegment == 0 {
                    BGColorView
                } else if selectedSegment == 1 {
                    SwitchIconView
                } else {
                    LogoColorView
                }
            }
        }
        .onAppear(perform: { getColors() })
        .actionSheet(isPresented: $showChooseImageSheet, content: { chooseImageSheet })
        // 本地图片选择弹窗
        .sheet(isPresented: $showImagePicker) {
            ImagePickerView(sourceType: .photoLibrary) { image in
                self.image = image
            }
        }
    }

    // MARK: 标题

    private var LogoTitleView: some View {
        Text("Logo生成器")
            .font(.system(size: 24))
            .fontWeight(.bold)
    }

    // MARK: Logo展示区域

    private var ShowLogoView: some View {
        Image(systemName: logoImage)
            .font(.system(size: 68))
            .foregroundColor(logoColor)
            .frame(minWidth: 80, maxWidth: 120, minHeight: 80, maxHeight: 120)
            .background(bgColor)
            .cornerRadius(8)
            .onTapGesture {
                self.showChooseImageSheet.toggle()
            }
    }

    // MARK: 本地图片

    private var ShowImageView: some View {
        Image(uiImage: image!)
            .resizable()
            .frame(width: 68, height: 68, alignment: .center)
            .clipShape(Circle())
            .padding(20)
            .background(bgColor)
            .cornerRadius(8)
            .onTapGesture {
                self.showChooseImageSheet.toggle()
            }
    }

    // MARK: - 选择来源弹窗

    private var chooseImageSheet: ActionSheet {
        let action = ActionSheet(title: Text("选择来源"), buttons: [.default(Text("相册"), action: {
            // 打开相册
            self.showImagePicker.toggle()
        }), .cancel(Text("取消"), action: {
        })])

        return action
    }

    // MARK: 分选选择

    private var SegmentView: some View {
        Picker("分段选择", selection: $selectedSegment) {
            ForEach(0 ..< 3) {
                Text(self.segmentTitle[$0]).tag($0)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }

    // MARK: 背景颜色

    private var BGColorView: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach(cardItems, id: \.cardColorRBG) { item in
                    Rectangle()
                        .fill(Color.Hex(item.cardBGColor))
                        .frame(width: 80, height: 80)
                        .cornerRadius(8)
                        .onTapGesture {
                            bgColor = Color.Hex(item.cardBGColor)
                        }
                }
            }
        }.padding()
    }

    // MARK: 图标切换

    private var SwitchIconView: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach(appleSymbols.indices, id: \.self) { item in
                    Image(systemName: appleSymbols[item])
                        .font(.system(size: 30))
                        .frame(width: 80, height: 80)
                        .background(bgColor)
                        .cornerRadius(8)
                        .onTapGesture {
                            logoImage = appleSymbols[item]
                        }
                }
            }
        }.padding()
    }

    // MARK: 图标颜色

    private var LogoColorView: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach(cardItems, id: \.cardColorRBG) { item in
                    Rectangle()
                        .fill(Color.Hex(item.cardBGColor))
                        .frame(width: 80, height: 80)
                        .cornerRadius(8)
                        .onTapGesture {
                            logoColor = Color.Hex(item.cardBGColor)
                        }
                }
            }
        }.padding()
    }

    // MARK: 网络请求

    func getColors() {
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: Constants.getColorsURL)!) { data, _, _ in
            guard let jsonData = data else { return }

            do {
                let colors = try JSONDecoder().decode([CardModel].self, from: jsonData)
                self.cardItems = colors
            } catch {
                print(error)
            }
        }
        .resume()
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
