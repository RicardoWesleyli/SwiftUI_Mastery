//
//  ContentView.swift
//  DragAndDrop
//
//  Created by Ricardo Li on 2022/8/27.
//

import SwiftUI
import WebKit

struct ContentView: View {
//    @StateObject var pageData = PageViewModel()
    @EnvironmentObject private var pageData: PageViewModel
    // Slide animation
    @Namespace var animation
    // columns
    let columns = Array(repeating: GridItem(.flexible(), spacing: 45), count: 2)

    var body: some View {
        VStack {
            // Custom Picker
            HStack {
                Image(systemName: "eyeglasses")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(pageData.selectedTab == "private" ? .black : .white)
                    .frame(width: 80, height: 45)
                    .background(
                        ZStack {
                            if pageData.selectedTab != "private" {
                                Color.clear
                            } else {
                                Color.white
                                    .cornerRadius(10)
                                    .matchedGeometryEffect(id: "Tab", in: animation)
                            }
                        }
                    )
                    .onTapGesture {
                        withAnimation {
                            pageData.selectedTab = "private"
                        }
                    }

                Text("1")
                    .frame(width: 35, height: 35)
                    .background(RoundedRectangle(cornerRadius: 8).stroke(pageData.selectedTab == "tabs" ? Color.black : Color.white, lineWidth: 3))
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(pageData.selectedTab == "tabs" ? .black : .white)
                    .frame(width: 80, height: 45)
                    .background(
                        ZStack {
                            if pageData.selectedTab != "tabs" {
                                Color.clear
                            } else {
                                Color.white
                                    .cornerRadius(10)
                                    .matchedGeometryEffect(id: "Tab", in: animation)
                            }
                        }
                    )
                    .onTapGesture {
                        withAnimation {
                            pageData.selectedTab = "tabs"
                        }
                    }

                Image(systemName: "laptopcomputer")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(pageData.selectedTab == "device" ? .black : .white)
                    .frame(width: 80, height: 45)
                    .background(
                        ZStack {
                            if pageData.selectedTab != "device" {
                                Color.clear
                            } else {
                                Color.white
                                    .cornerRadius(10)
                                    .matchedGeometryEffect(id: "Tab", in: animation)
                            }
                        }
                    )
                    .onTapGesture {
                        withAnimation {
                            pageData.selectedTab = "device"
                        }
                    }
            }
            .background(Color.white.opacity(0.15))
            .cornerRadius(15)
            .padding(.top)

            ScrollView {
                // Tab with pages
                LazyVGrid(columns: columns, spacing: 20, content: {
                    ForEach(pageData.urls) { url in
                        WebView(url: url.url)
                            .frame(height: 200)
                            .cornerRadius(15)
                            .onDrag({
                                // Set current page
                                pageData.currentPage = url
                                // Send Id for sample
                                return NSItemProvider(contentsOf: URL(string: "\(url.id)")!)!
                            })
                            .onDrop(of: [.url], delegate: DropViewDelegate(page: url, pageData: pageData))
                    }
                })
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.ignoresSafeArea(.all, edges: .all))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WebView: UIViewRepresentable {
    var url: URL
    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView()
        view.load(URLRequest(url: url))
        view.isUserInteractionEnabled = false
        // Scale web view
        view.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
        return view
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {

    }
}
