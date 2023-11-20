//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Nicolai Bodean on 10.11.2023.
//

import Foundation
import SwiftUI


struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                //Conditional Statement with Nil Coalesing
                
                //Condition ? A : B
                configuration.isPressed ?
                //A: when user press the button
                LinearGradient(colors: [.customGrayMedium, .customGrayLight], startPoint: .top, endPoint: .bottom) :
                //B: when user is dont press
                LinearGradient(
                    colors: [
                        .customGrayLight,
                        .customGrayMedium],
                    startPoint: .top,
                    endPoint: .bottom))
                .cornerRadius(40)
        
    }
}
