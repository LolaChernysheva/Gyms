//
//  CatalogItemView.swift
//  Gyms
//
//  Created by Lolita Chernysheva on 02.03.2026.
//  
//


import SwiftUI
import Combine


struct CatalogItemView: View {
    
    @ObservedObject var viewModel: CatalogItemViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Image(viewModel.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 140, height: 180)
            ZStack {
                Text(viewModel.title)
                    .lineLimit(2)
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding(.horizontal, 5)
                    .frame(width: 140, height: 60, alignment: .topLeading)
            }
            .frame(width: 140)
            
        }
        .background(Color.cellBackground)
        .cornerRadius(8)
    }
}

#Preview {
    CatalogItemView(viewModel: CatalogItemViewModel(title: "Румыеская тяга", imageName: Assets.ImageName.Back.deadlift.rawValue))
}
