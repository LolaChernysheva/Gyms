//
//  TodayWorkoutViewModel.swift
//  Gyms
//
//  Created by Lolita Chernysheva on 02.03.2026.
//  
//
import Combine

final class TodayWorkoutViewModel: ObservableObject {
    var title: String
    
    @Published var exercises: [Exercise] = []
    
    init(title: String, exercises: [Exercise]) {
        self.title = title
        self.exercises = exercises
    }
    
    func addExercise(_ exercise: Exercise) {
        exercises.append(exercise)
    }
    
    func finish() {
        
    }
}

