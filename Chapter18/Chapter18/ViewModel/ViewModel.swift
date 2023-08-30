//
//  ViewModel.swift
//  Chapter18
//

import SwiftUI

class ViewModel: ObservableObject {
    
    // 点击跳转新增笔记页面
    @Published var showNewNoteView: Bool = false
    
    // 编辑/新增操作判断
    @Published var isEdit: Bool = false
    
    // 笔记参数
    @Published var noteID: UUID = UUID()
    @Published var content: String = ""
    
    // 深色模式切换设置
    @AppStorage("darkMode") var darkMode = false
    
    // 数据模型
    @Published var noteModels = [NoteModel]()
    
    // 启动时
    init() {
        loadItems()
    }
    
    // 获取设备上的文档目录路径
    func documentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    // 获取plist数据文件的路径
    func dataFilePath() -> URL {
        documentsDirectory().appendingPathComponent("NoteModel.plist")
    }
    
    // 加载本地数据
    func loadItems() {
        let path = dataFilePath()
        // 如果没有数据则跳过
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                noteModels = try decoder.decode([NoteModel].self, from: data)
            } catch {
                print("错误提示: \(error.localizedDescription)")
            }
        }
    }
    
    // 写入本地数据
    func saveItems() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(noteModels)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
        } catch {
            print("错误提示: \(error.localizedDescription)")
        }
    }
    
    // 新增
    func addItem(content: String, updateTime: String) {
        let newItem = NoteModel(content: content, updateTime: updateTime)
        noteModels.append(newItem)
        saveItems()
    }

    // 编辑
    func editItem(item: NoteModel) {
        if let id = noteModels.firstIndex(where: { $0.id == item.id }) {
            noteModels[id] = item
            saveItems()
        }
    }

    // 删除
    func deleteItem(itemId: UUID) {
        noteModels.removeAll(where: { $0.id == itemId })
        saveItems()
    }
    
    // 获得当前时间
    func getTime() -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        return dateformatter.string(from: Date())
    }
}
