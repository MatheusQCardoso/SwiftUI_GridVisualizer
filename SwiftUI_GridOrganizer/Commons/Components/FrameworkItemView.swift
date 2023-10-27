//
//  FrameworkItemView.swift
//  SwiftUI_GridOrganizer
//
//  Created by Matheus Quirino Cardoso on 26/10/23.
//

import SwiftUI

struct FrameworkItemView: View {
    
    let framework: Framework
    let isVertical: Bool
    
    private var iconFrameSize: CGFloat { isVertical ? 100 : 70 }
    
    var image: some View {
        Image(framework.imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: iconFrameSize, height: iconFrameSize)
    }
    
    var text: some View {
        Text(framework.name)
            .foregroundStyle(Color(.label))
            .font(.title2)
            .fontWeight(.semibold)
            .scaledToFit()
            .minimumScaleFactor(0.6)
    }
    
    var body: some View {
        if isVertical {
            VStack {
                image
                text
            }
            .padding()
        } else {
            HStack {
                image
                text.padding()
                Spacer()
            }
        }
    }
}
