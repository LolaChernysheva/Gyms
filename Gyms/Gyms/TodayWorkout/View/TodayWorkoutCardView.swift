//
//  TodayWorkoutCardView.swift
//  Gyms
//
//  Created by Lolita Chernysheva on 02.03.2026.
//  
//

import SwiftUI
import Combine

struct Set: Identifiable {
    let id = UUID()
    var reps: Int8
    var weight: Int8
}

final class TodayWorkoutCardViewModel: ObservableObject {
    let id = UUID()
    var imageName: String
    var title: String
    @Published var sets: [Set] = []
    
    init(imageName: String, title: String) {
        self.imageName = imageName
        self.title = title
    }
    
    func addSet() {
        sets.append(Set(reps: 0, weight: 0))
    }
    
    func deleteSet(at id: UUID) {
        if let index = sets.firstIndex(where: { $0.id == id }) {
            sets.remove(at: index)
        }
    }
}

struct TodayWorkoutCardView: View {
    
    @ObservedObject var viewModel: TodayWorkoutCardViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            exerciseImage
            exerciseTitle
            setsView
            addSetButton
        }
    }
    
    private var exerciseImage: some View {
        Image(viewModel.imageName)
            .resizable()
            .frame(height: 100)
            .scaledToFit()
    }
    
    private var exerciseTitle: some View {
        HStack() {
            Text(viewModel.title)
                .font(.headline)
            Spacer()
        }
    }
    
    private var setsView: some View {
        ForEach(Array(viewModel.sets.enumerated()), id: \.element.id) { index, set in
            SetRowView(
                viewModel: SetRowViewModel(
                    setNumber: Int8(index + 1),
                    repsNumber: set.reps,
                    weight: set.weight,
                    onDelete: { id in
                        viewModel.deleteSet(at: id)
                    }
                )
            )
        }
    }
    
    private var addSetButton: some View {
        Button("Добавить сет") {
            viewModel.addSet()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 40)
        .background(Color.background)
        .cornerRadius(8)
        .tint(Color.buttonBackground)
        .fontWeight(.semibold)
    }
}

#Preview {
    TodayWorkoutCardView(viewModel: TodayWorkoutCardViewModel(
        imageName: Assets.ImageName.Back.pullUp.rawValue,
        title: "Pull up")
    )
}
