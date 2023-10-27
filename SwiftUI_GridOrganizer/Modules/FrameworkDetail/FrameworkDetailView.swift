//
//  FrameworkDetailView.swift
//  SwiftUI_GridOrganizer
//
//  Created by Matheus Quirino Cardoso on 26/10/23.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    let framework: Framework
    @State private var isShowingSafariView: Bool = false
    
    var body: some View {
        VStack {
            FrameworkItemView(framework: framework, isVertical: true)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                isShowingSafariView = true
            } label: {
                Label("Learn More", systemImage: "book.fill")
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(.red)
        }
        .sheet(isPresented: $isShowingSafariView) {
            if let url = URL(string: framework.urlString) {
                SafariView(url: url)
            }
        }
    }
}

//MARK: - PREVIEW SETUP -
#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework)
}
