//
//  AsImage.swift
//  Chapter20
//

import SwiftUI

extension View {
    func snapshot() -> UIImage? {
        let controller = UIHostingController(
            rootView: ignoresSafeArea()
                .fixedSize(horizontal: true, vertical: true)
        )
        guard let view = controller.view else { return nil }

        let targetSize = view.intrinsicContentSize
        if targetSize.width <= 0 || targetSize.height <= 0 { return nil }

        view.bounds = CGRect(origin: .zero, size: targetSize)
        view.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}
