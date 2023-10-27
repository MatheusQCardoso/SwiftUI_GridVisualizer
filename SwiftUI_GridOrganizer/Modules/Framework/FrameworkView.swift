//
//  FrameworkView.swift
//  SwiftUI_GridOrganizer
//
//  Created by Matheus Quirino Cardoso on 26/10/23.
//

import SwiftUI

struct FrameworkView: View {
    
    @State var isDisplayModeGrid: Bool = true
    @StateObject var viewModel = FrameworkViewModel()
    
    var content: some View {
        ForEach(viewModel.gridData) { framework in
            NavigationLink(value: framework) {
                FrameworkItemView(framework: framework, isVertical: isDisplayModeGrid)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                DisplayModeSelectionView(isDisplayModeGrid: $isDisplayModeGrid)
                
                if isDisplayModeGrid {
                    ScrollView {
                        LazyVGrid(columns: viewModel.columns) { content }
                    }
                } else {
                    List { content }
                }
            }
            .padding(.top, 20)
            .navigationTitle("🍏 Frameworks")
            .navigationDestination(for: Framework.self) { framework in
                FrameworkDetailView(framework: framework)
            }
        }.tint(Color(.label))
    }
}

#Preview {
    FrameworkView()
}
