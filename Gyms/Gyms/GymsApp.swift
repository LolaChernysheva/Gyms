//
//  GymsApp.swift
//  Gyms
//
//  Created by Lolita Chernysheva on 02.03.2026.
//  
//

import SwiftUI

@main
struct GymsApp: App {
    let title = Date().formatted(
        .dateTime
            .day()
            .month(.wide)
            .locale(Locale(identifier: "ru_RU"))
    )
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                TodayWorkoutView(viewModel: TodayWorkoutViewModel(title: title, exercises: []))
            }
        }
    }

}
