//
//  CardView.swift
//  Hike
//
//  Created by Nicolai Bodean on 10.11.2023.
//

import SwiftUI

struct CardView: View {
    //mark: - properties
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    //mark: - functions
    func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        
        randomNumber = Int.random(in: 1...5)
        imageNumber = randomNumber
    }
    
    var body: some View {
        
        ZStack {
            CustomBackgroungView()
            
            VStack {
                //Mark; - Header
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [
                                        .customGrayLight,
                                        .customGrayMedium],
                                    startPoint: .top,
                                endPoint: .bottom))
                        
                        Spacer()
                        
                        Button {
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                    }
                    
                    Text("Fun and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                    
                }
                .padding(.horizontal, 30)
                
                //Mark; - Main Content
                
                ZStack {
                   CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                            .resizable()
                            .scaledToFit()
                            .animation(.default, value: imageNumber)
                }
                //Mark: - Footer
                Button{
                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(colors: [.customGreenLight], 
                                           startPoint: .top,
                                           endPoint: .bottom))
                        .shadow(
                            color:
                            .black.opacity(0.25),
                             radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButton())
                
            } //: VStack
        } //: Card
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
