//
//  CatalogView.swift
//  Gyms
//
//  Created by Lolita Chernysheva on 02.03.2026.
//  
//

import SwiftUI

struct CatalogView: View {
    
    @ObservedObject var viewModel: CatalogViewModel
    @State private var searchText: String = ""
    @Environment(\.dismiss) private var dismiss
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 30) {
                ForEach(viewModel.categories) { category in
                    Text(category.category.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 16)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 16) {
                            ForEach(category.exercises) { exercise in
                                CatalogItemView(
                                    viewModel: CatalogItemViewModel(
                                        title: exercise.title,
                                        imageName: exercise.imageName
                                    )
                                ).onTapGesture {
                                    viewModel.onSelect(exercise)
                                    dismiss()
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                }
            }
        }
        .searchable(text: $searchText, placement: .automatic, prompt: "Поиск")
        .background(Color.background)
    }
}

#Preview {
    NavigationStack {
        CatalogView(viewModel: CatalogViewModel(onSelect: {_ in }))
            .navigationTitle("Выбор упражнения")
    }
}
