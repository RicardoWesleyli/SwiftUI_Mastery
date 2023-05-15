//
//  CShape.swift
//  SwiftUISkill
//
//  Created by Ricardo Li on 2022/7/15.
//

import SwiftUI

struct CShape: Shape {

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: [.topRight, .bottomLeft],
            cornerRadii: CGSize(width: 55, height: 55)
        )
        return Path(path.cgPath)
    }
}

struct CShapeView: View {

    var body: some View {
       Rectangle()
            .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing))
            .frame(width: 100, height: 100)
            .clipShape(CShape())
    }
}

struct CShapeView_Previews: PreviewProvider {
    static var previews: some View {
        CShapeView()
    }
}
