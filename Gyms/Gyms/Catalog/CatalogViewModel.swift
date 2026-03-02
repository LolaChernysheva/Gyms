//
//  CatalogViewModel.swift
//  Gyms
//
//  Created by Lolita Chernysheva on 02.03.2026.
//  
//

import Combine
import SwiftUI

final class CatalogViewModel: ObservableObject {
    let categories: [ActivityCategory] = ActivityCategory.all
    var onSelect: (Exercise) -> Void
    
    init(onSelect: @escaping (Exercise) -> Void) {
        self.onSelect = onSelect
    }
    
}
