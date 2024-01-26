//
//  AuraView.swift
//  IGT Music Workshop
//
//  Created by Андрей Чередник on 26.01.2024.
//

import SwiftUI


struct AuroraView: View {
    
    
    private enum AnimationProperties {
        static let animationSpeed: Double = 4
        static let timerDuration: TimeInterval = 2
        static let blurRadius: CGFloat = 160
    }
    
    @State private var timer = Timer.publish(every: AnimationProperties.timerDuration, on: .main, in: .common).autoconnect()
    @StateObject private var animator = CircleAnimator(colors: AuroraColors.all)
    
    var body: some View {
        ZStack{
            ZStack {
                ForEach(animator.circles) { circle in
                    MovingCircle(originOffset: circle.position)
                        .foregroundColor(circle.color)
                }
            }
            .background(AuroraColors.backgroundColor)
            .blur(radius: AnimationProperties.blurRadius)
            
            .onDisappear {
                timer.upstream.connect().cancel()
            }
            .onTapGesture {
                animateCircles()
                timer = Timer.publish(every: AnimationProperties.timerDuration, on: .main, in: .common).autoconnect()
            }
            .onReceive(timer) { _ in
                animateCircles()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .animation(.easeInOut(duration: AnimationProperties.animationSpeed))

    }
    
    private func animateCircles() {
        withAnimation(.easeInOut(duration: AnimationProperties.animationSpeed)) {
            animator.animate()
        }
    }
    
}

private enum AuroraColors {
    static var all: [Color] {
        [
            Color.black,
            Color(red: 144/255, green: 191/255, blue: 122/255, opacity: 0.6),
            Color.black,
            Color(red: 144/255, green: 191/255, blue: 122/255, opacity: 0.6),
            Color.black
        ]
    }
    
    static var backgroundColor: Color {
        Color.black
    }
}

private struct MovingCircle: Shape {
    
    var originOffset: CGPoint
    
    var animatableData: CGPoint.AnimatableData {
        get {
            originOffset.animatableData
        }
        set {
            originOffset.animatableData = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let adjustedX = rect.width * originOffset.x
        let adjustedY = rect.height * originOffset.y
        let smallestDimension = min(rect.width, rect.height)
        path.addArc(center: CGPoint(x: adjustedX, y: adjustedY), radius: smallestDimension/2, startAngle: .zero, endAngle: .degrees(360), clockwise: true)
        return path
    }
}

private class CircleAnimator: ObservableObject {
    class Circle: Identifiable {
        internal init(position: CGPoint, color: Color) {
            self.position = position
            self.color = color
        }
        var position: CGPoint
        let id = UUID().uuidString
        let color: Color
    }
    
    @Published private(set) var circles: [Circle] = []
    
    
    init(colors: [Color]) {
        circles = colors.map({ color in
            Circle(position: CircleAnimator.generateRandomPosition(), color: color)
        })
    }
    
    func animate() {
        objectWillChange.send()
        for circle in circles {
            circle.position = CircleAnimator.generateRandomPosition()
        }
    }
    
    static func generateRandomPosition() -> CGPoint {
        CGPoint(x: CGFloat.random(in: 0 ... 1), y: CGFloat.random(in: 0 ... 1))
    }
}

