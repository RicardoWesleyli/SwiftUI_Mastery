//
//  OneWordWidgetBundle.swift
//  OneWordWidget
//
//  Created by Ricardo Li on 2023/5/10.
//

import WidgetKit
import SwiftUI

@main
struct OneWordWidgetBundle: WidgetBundle {
    var body: some Widget {
        OneWordWidget()
        OneWordWidgetLiveActivity()
    }
}
