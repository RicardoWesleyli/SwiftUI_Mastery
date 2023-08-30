//
//  SwiftUIList.swift
//  Chapter8
//

import SwiftUI

struct SwiftUIList: View {
    @State var sentences = Sentences

    var body: some View {
        NavigationView {
            ZStack{
                Color(.systemGray6).edgesIgnoringSafeArea(.all)
                List {
                    ForEach(sentences) { item in
                        ListItem(image: item.image, text: item.text)
                    }
                    .onMove(perform: moveItem)
                    .onDelete(perform: deleteRow)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                }
                .listStyle(PlainListStyle())
                .navigationBarTitle("账号中心",displayMode: .inline)
                .navigationBarItems(trailing: EditButton())
            }
        }
    }
    // 拖动排序方法
    func moveItem(from source: IndexSet, to destination: Int) {
        sentences.move(fromOffsets: source, toOffset: destination)
    }
    //滑动删除方法
    func deleteRow(at offsets: IndexSet) {
        sentences.remove(atOffsets: offsets)
    }
}
// 列表组件
struct ListItem: View {
    var image: String
    var text: String

    var body: some View {
        HStack(spacing: 20) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color(.systemGray5), lineWidth: 1)
                )
            Text(text)
        }
        .padding(.all, 5)
    }
}

struct SwiftUIList_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIList()
    }
}
