//
//  TodayWorkoutView.swift
//  Gyms
//
//  Created by Lolita Chernysheva on 02.03.2026.
//  
//

import SwiftUI

struct TodayWorkoutView: View {
    
    @ObservedObject var viewModel: TodayWorkoutViewModel
    @State private var showCatalog = false
    
    var body: some View {
            VStack {
                exercisesList
                finishButton
                
            }
            .navigationTitle(viewModel.title)
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    if !viewModel.exercises.isEmpty {
                        Button {
                            showCatalog = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
            .navigationDestination(isPresented: $showCatalog) {
                CatalogView(viewModel: CatalogViewModel(onSelect: { exercise in
                    viewModel.addExercise(exercise)
                }))
            }
    }
}

/// views

private extension TodayWorkoutView {
    
    @ViewBuilder
    private var exercisesList: some View {
        if viewModel.exercises.isEmpty {
            emptyView
        } else {
            List {
                ForEach(viewModel.exercises) { exercise in
                    Section {
                        activityCard(exercise: exercise)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private var emptyView: some View {
        VStack {
            Text("Добавь первое упражнение")
            Image(systemName: "dumbbell")
                .frame(width: 100, height: 100, alignment: .center)
            Button("Начать") {
                showCatalog = true
            }
            .foregroundColor(.cellBackground)
            .fontWeight(.semibold)
            .frame(width: 120, height: 40)
            .background(.buttonBackground)
            .cornerRadius(8)
            .padding(16)
        }
    }
    
    @ViewBuilder
    private var finishButton: some View {
        if !viewModel.exercises.isEmpty {
            Button("Завершить тренировку") {
                viewModel.finish()
            }
            .foregroundColor(.cellBackground)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .background(.buttonBackground)
            .cornerRadius(8)
            .padding(16)
        }
    }
    
    private func activityCard(exercise: Exercise) -> some View {
        TodayWorkoutCardView(viewModel: TodayWorkoutCardViewModel(
            imageName: exercise.imageName,
            title: exercise.title))
    }
}

#Preview {
    NavigationStack {
        TodayWorkoutView(viewModel: TodayWorkoutViewModel(
            title: "27 февраля",
            exercises: [
                .init(title: "Pull up", imageName: Assets.ImageName.Back.pullUp.rawValue),
                .init(title: "Pull up", imageName: Assets.ImageName.Back.pullUp.rawValue)
            ])
        )
    }
}


