//
//  goToAppStore.swift
//  SwiftUIGradient
//
//  Created by Ricardo Li on 2022/6/30.
//

import SwiftUI

// MARK: - 前往Appstore方法

func gotoAppStore(appId: String) {
    let urlPrex = "itms-apps"
    let appUrl = urlPrex + "://itunes.apple.com/app/id" + appId
    let appNsUrl = NSURL(string: appUrl)
    UIApplication.shared.open(appNsUrl! as URL, options: [:], completionHandler: nil)
}
