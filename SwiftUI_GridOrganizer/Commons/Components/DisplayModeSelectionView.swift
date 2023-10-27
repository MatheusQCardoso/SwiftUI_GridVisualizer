//
//  DisplayModeSelectionView.swift
//  SwiftUI_GridOrganizer
//
//  Created by Matheus Quirino Cardoso on 26/10/23.
//

import SwiftUI

struct DisplayModeSelectionView: View {
    
    @Binding var isDisplayModeGrid: Bool
    
    var body: some View {
        HStack {
            Spacer()
            
            DisplayModeSelectionItem(symbolName: "square.grid.3x3",
                                     isSelected: isDisplayModeGrid) {
                isDisplayModeGrid = true
            }
            
            Divider()
                .frame(width: 2, height: 30)
                .background(Color(.label.withAlphaComponent(0.7)))
                .padding()
            
            DisplayModeSelectionItem(symbolName: "list.triangle",
                                     isSelected: !isDisplayModeGrid) {
                isDisplayModeGrid = false
            }
        }.padding(.trailing)
    }
}

//MARK: - Item
struct DisplayModeSelectionItemModel: Hashable, Identifiable {
    let id = UUID()
    
    let symbolName: String
}

struct DisplayModeSelectionItem: View {
    
    let symbolName: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Image(systemName: symbolName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 28, height: 28)
            .foregroundStyle(
                isSelected ?
                    Color(.label) :
                    Color(.label.withAlphaComponent(0.6))
            )
            .onTapGesture(perform: action)
    }
}

//MARK: - PREVIEW SETUP -
#Preview {
    DisplayModeSelectionView(isDisplayModeGrid: .constant(true))
        .preferredColorScheme(.dark)
}
