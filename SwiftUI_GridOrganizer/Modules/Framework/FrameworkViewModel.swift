//
//  FrameworkGridViewModel.swift
//  SwiftUI_GridOrganizer
//
//  Created by Matheus Quirino Cardoso on 26/10/23.
//

import SwiftUI

final class FrameworkViewModel: ObservableObject {
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    //MARK: - MOCKS -
    let gridData: [Framework] = MockData.frameworks
}
