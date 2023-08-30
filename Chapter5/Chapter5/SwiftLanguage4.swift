//
//  SwiftLanguage4.swift
//  Chapter5
//

import SwiftUI

struct SwiftLanguage4: View {
    var isOn: Bool = false

    var body: some View {
        Image(systemName: isOn ? "video" : "video.slash")
            .font(.system(size: 32))
            .foregroundColor(isOn ? .black : .gray)
    }
}

struct SwiftLanguage4_Previews: PreviewProvider {
    static var previews: some View {
        SwiftLanguage4()
    }
}
