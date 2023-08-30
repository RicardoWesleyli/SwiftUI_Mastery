//
//  OneWordWidgetBundle.swift
//  OneWordWidget
//
//  Created by Ricardo Li on 2023/8/30.
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
