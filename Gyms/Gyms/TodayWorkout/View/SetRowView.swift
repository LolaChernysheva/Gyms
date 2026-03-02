//
//  SetRowView.swift
//  Gyms
//
//  Created by Lolita Chernysheva on 02.03.2026.
//  
//

import SwiftUI
import Combine

final class SetRowViewModel: ObservableObject {
    let id = UUID()
    var setNumber: Int8
    var repsNumber: Int8
    var weight: Int8
    
    var onDelete: (UUID) -> Void
    
    init(setNumber: Int8, repsNumber: Int8, weight: Int8, onDelete: @escaping (UUID) -> Void) {
        self.setNumber = setNumber
        self.repsNumber = repsNumber
        self.weight = weight
        self.onDelete = onDelete
    }
}

struct SetRowView: View {
    
    @ObservedObject var viewModel: SetRowViewModel
    var body: some View {
        HStack(spacing: 16) {
            Text("Сет \(viewModel.setNumber)")
            HStack {
                TextField("Reps", text: .constant("\(viewModel.repsNumber)"))
                    .textFieldStyle(.automatic)
                    .multilineTextAlignment(.trailing)
                Text("повт")
            }
            .padding(5)
            .frame(height: 40)
            .background(Color.background)
            .cornerRadius(8)
            HStack {
                TextField("Weight", text: .constant("\(viewModel.weight)"))
                    .textFieldStyle(.automatic)
                    .multilineTextAlignment(.trailing)
                Text("кг")
            }
            .padding(5)
            .frame(height: 40)
            .background(Color.background)
            .cornerRadius(8)
            Button(action: {
                viewModel.onDelete(viewModel.id)
            }, label: {
                Image(systemName: "trash")
                    .foregroundColor(.secondary)
            })
            
        }
    }
}

#Preview {
    SetRowView(viewModel: SetRowViewModel(
        setNumber: 1,
        repsNumber: 3,
        weight: 20,
    onDelete: {_ in })
    )
}
