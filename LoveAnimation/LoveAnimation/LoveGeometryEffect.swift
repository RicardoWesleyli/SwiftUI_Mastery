//
//  LoveGeometryEffect.swift
//  LoveAnimation
//
//  Created by Ricardo Li on 2022/7/16.
//

import SwiftUI

struct LoveGeometryEffect : GeometryEffect {
    var time : Double
    var speed = Double.random(in: 100 ... 200)
    var xDirection = Double.random(in:  -0.1 ... 0.1)
    var yDirection = Double.random(in: -Double.pi ...  0)
    
    var animatableData: Double {
        get { time }
        set { time = newValue }
    }
    func effectValue(size: CGSize) -> ProjectionTransform {
        let xTranslation = speed * xDirection
        let yTranslation = speed * sin(yDirection) * time
        let affineTranslation =  CGAffineTransform(translationX: xTranslation, y: yTranslation)
        return ProjectionTransform(affineTranslation)
    }
}
