//
//  ModelView.swift
//  DragAndDrop
//
//  Created by Ricardo Li on 2022/8/27.
//

import SwiftUI

class PageViewModel: ObservableObject {
    // SelectedTab
    @Published var selectedTab = "tabs"
    
    @Published var urls = [
        Page(url: URL(string: "https://www.google.com")!),
        Page(url: URL(string: "https://www.apple.com")!),
        Page(url: URL(string: "https://www.baidu.com")!),
        Page(url: URL(string: "https://www.sina.com.cn")!),
        Page(url: URL(string: "https://www.alibaba.com")!),
        Page(url: URL(string: "https://www.163.com")!),
        Page(url: URL(string: "https://www.twitter.com")!),
        Page(url: URL(string: "https://www.facebook.com")!),
        Page(url: URL(string: "https://www.qq.com")!),
        Page(url: URL(string: "https://www.ebay.com")!),
        Page(url: URL(string: "https://www.microsoft.com")!),
        Page(url: URL(string: "https://www.bing.com")!),
    ]

    // Currently dragging page
    @Published var currentPage: Page?
}


struct DropViewDelegate: DropDelegate {
    var page: Page
    var pageData: PageViewModel
    
    func performDrop(info: DropInfo) -> Bool {
        return true
    }

    // When user dragged into new page
    func dropEntered(info: DropInfo) {
        // get from and to index
        // From index
        let fromIndex = pageData.urls.firstIndex { $0.id == pageData.currentPage?.id } ?? 0
        // To index
        let toIndex = pageData.urls.firstIndex { $0.id == page.id } ?? 0

        if fromIndex != toIndex {
            withAnimation(.default) {
                // Swap data
                let fromPage = pageData.urls[fromIndex]
                pageData.urls[fromIndex] = pageData.urls[toIndex]
                pageData.urls[toIndex] = fromPage
            }
        }
    }

    // Set action as move
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
}
