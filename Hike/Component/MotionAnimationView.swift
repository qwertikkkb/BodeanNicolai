//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Nicolai Bodean on 10.11.2023.
//

import SwiftUI

struct MotionAnimationView: View {
    @State private var randomCircle: Int = Int.random(in: 6...12)
    @State private var isAnimating: Bool = false
    
    
    //Mark: - Functions
    
    //1. random coordinations
    func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    //2. random size
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 4...80))
    }
    //3. random scale
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    //4. random speed
    func randomSpeed() -> Double {
        return Double.random(in: 0.05...1.0)
    }
    //5. random dealay
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    //Mark: - Properties
   
    var body: some View {
        ZStack{
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(
                        x: randomCoordinate(),
                        y: randomCoordinate())
                    .scaleEffect(isAnimating ? randomScale() :1)
                    .onAppear(perform: {
                        withAnimation(
                            .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ){ isAnimating = true}
                    })
                              }
            
        }//ZStack
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

#Preview {
    ZStack{
        MotionAnimationView()
            .background(
                Circle()
                    .fill(.teal))
        
    }
    
}
