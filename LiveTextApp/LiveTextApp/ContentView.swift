//
//  ContentView.swift
//  LiveTextApp
//
//  Created by Ricardo Li on 2022/7/9.
//

import SwiftUI
import VisionKit

struct ContentView: View {
    
    @State private var startScanning = false
    @State private var scanText = ""
    
    var body: some View {
        
        VStack(spacing: 0) {
            DataScanner(startScanning: $startScanning, scanText: $scanText)
                .frame(height: 400)
            
            Text(scanText)
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
                .background(in: Rectangle())
                .backgroundStyle(Color(uiColor: .systemGray6))
                
        }
        .task {
            if DataScannerViewController.isSupported && DataScannerViewController.isAvailable {
                startScanning.toggle()
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

