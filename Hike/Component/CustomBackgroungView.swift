//
//  CustomBackgroungView.swift
//  Hike
//
//  Created by Nicolai Bodean on 10.11.2023.
//

import SwiftUI

struct CustomBackgroungView: View {
    var body: some View {
        ZStack {
            //Mark: - 3 Depth
            Color.customGreenDark
                .cornerRadius(40)
                .offset(y:12)
            
            //Mark: - 2 Light
            Color.customGreenLight
                .cornerRadius(40)
                .offset(y: 3)
                .opacity(0.85)
            
            //Mark: - 1 Surface
            LinearGradient(
                colors: [
                    .customGreenLight,
                    .customGreenMedium],
                    startPoint: .top,
                    endPoint: .bottom)
            .cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackgroungView()
        .padding()
}
