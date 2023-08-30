//
//  SwiftLanguage3.swift
//  Chapter5
//

import SwiftUI

struct SwiftLanguage3: View {
    
    // 赋值运算符
    let imageName:String = "DemoImage"
    let screenWidth = UIScreen.main.bounds.size.width
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: screenWidth - 20) // 算术运算符
    }
}

struct SwiftLanguage3_Previews: PreviewProvider {
    static var previews: some View {
        SwiftLanguage3()
    }
}
