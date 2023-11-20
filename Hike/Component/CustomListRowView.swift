//
//  CustomListRowView.swift
//  Hike
//
//  Created by Nicolai Bodean on 10.11.2023.
//

import SwiftUI

struct CustomListRowView: View {
    //Mark: - Properties
    @State var rowLabel:           String
    @State var rowIcon:            String
    @State var rowContent:         String? = nil
    @State var rowTintColor:       Color
    @State var rowLinkLabel:       String? = nil
    @State var rowLinkDestanation: String? = nil
    var body: some View {
        LabeledContent {
            //Content
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundColor(.primary)
                    .fontWeight(.heavy)
            } else if (rowLinkLabel != nil && rowLinkDestanation != nil) {
                Link(rowLinkLabel!, destination: URL(string: rowLinkDestanation!)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
            } else {
                EmptyView()
            }
        } label: {
            //Label
            HStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
            }
        }
    }
}

#Preview {
    List {
        CustomListRowView(
            rowLabel: "Website",
            rowIcon: "globe",
            rowContent: nil,
            rowTintColor: .pink,
            rowLinkLabel: "Apple",
            rowLinkDestanation: "http://apple.com")
    }
}

