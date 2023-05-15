//
//  ContentView.swift
//  ParticleEffects
//
//  Created by Ricardo Li on 2022/8/9.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black

            Image(systemName: "heart.fill")
                .foregroundColor(Color.red)
                .font(.system(size: 60))
                .modifier(ParticleEffectView(count: 100))

            Image(systemName: "heart.fill")
                .foregroundColor(Color.green)
                .font(.system(size: 60))
                .modifier(ParticleEffectView(count: 100))

            Image(systemName: "heart.fill")
                .foregroundColor(Color.blue)
                .font(.system(size: 60))
                .modifier(ParticleEffectView(count: 100))
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// 粒子视图

struct ParticleEffectView: ViewModifier {
    let count: Int
    let duration: Double = 2.0
    @State var time: Double = 0.0

    func body(content: Content) -> some View {
        let animation = Animation.linear(duration: duration).repeatForever(autoreverses: false)

        ZStack {
            ForEach(0 ..< count, id: \.self) { _ in
                content
                    .scaleEffect(CGFloat((duration - self.time) / duration))
                    .modifier(ParticleMotion(time: self.time))
                    .opacity((duration - self.time) / duration)
                    .animation(animation.delay(Double.random(in: 0 ..< self.duration)))
                    .blendMode(.plusLighter)
            }
            .onAppear {
                withAnimation {
                    self.time = duration
                }
            }
        }
    }
}

// 粒子动画

struct ParticleMotion: GeometryEffect {
    var time: Double
    let v0: Double = Double.random(in: 40 ... 80)
    let alpha: Double = Double.random(in: 0.0 ..< 2 * Double.pi)
    let g = 15 * 9.81

    var animatableData: Double {
        get { time }
        set { time = newValue }
    }

    func effectValue(size: CGSize) -> ProjectionTransform {
        let dx = v0 * time * cos(alpha)
        let dy = v0 * sin(alpha) * time - 0.5 * g * time * time
        let affineTransform = CGAffineTransform(translationX: CGFloat(dx), y: CGFloat(-dy))
        return ProjectionTransform(affineTransform)
    }
}
