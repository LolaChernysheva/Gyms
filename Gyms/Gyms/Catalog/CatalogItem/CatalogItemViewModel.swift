//
//  CatalogItemViewModel.swift
//  Gyms
//
//  Created by Lolita Chernysheva on 02.03.2026.
//  
//

import Combine
import SwiftUI

final class CatalogItemViewModel: ObservableObject {
    let id = UUID()
    let title: String
    let imageName: String
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}

