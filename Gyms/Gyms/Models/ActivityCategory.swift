//
//  ActivityCategory.swift
//  Gyms
//
//  Created by Lolita Chernysheva on 02.03.2026.
//  
//


import Foundation

// MARK: - Category

enum Category: String, CaseIterable, Identifiable {
    case back
    case legsGlutes
    case chest
    case shoulders
    case arms
    case core
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .back: return "Спина"
        case .legsGlutes: return "Ноги и ягодицы"
        case .chest: return "Грудь"
        case .shoulders: return "Плечи"
        case .arms: return "Руки"
        case .core: return "Пресс"
        }
    }
}

// MARK: - Exercise

struct Exercise: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let imageName: String
}

// MARK: - ActivityCategory

struct ActivityCategory: Identifiable {
    let id = UUID()
    let category: Category
    let exercises: [Exercise]
}

extension ActivityCategory {
    
    static let all: [ActivityCategory] = [
        
        // MARK: - Спина
        ActivityCategory(
            category: .back,
            exercises: [
                Exercise(title: "Deadlift", imageName: Assets.ImageName.Back.deadlift.rawValue),
                // Становая тяга
                
                Exercise(title: "Romanian Deadlift", imageName: Assets.ImageName.Back.romanianDeadlift.rawValue),
                // Румынская тяга
                
                Exercise(title: "Pull-Up", imageName: Assets.ImageName.Back.pullUp.rawValue),
                // Подтягивания
                
                Exercise(title: "Lat Pulldown", imageName: Assets.ImageName.Back.latPulldown.rawValue),
                // Тяга верхнего блока к груди
                
                Exercise(title: "Barbell Bent-Over Row", imageName: Assets.ImageName.Back.barbellBentOverRow.rawValue),
                // Тяга штанги в наклоне
                
                Exercise(title: "One-Arm Dumbbell Row", imageName: Assets.ImageName.Back.oneArmDumbbellRow.rawValue),
                // Тяга гантели одной рукой
                
                Exercise(title: "Seated Cable Row", imageName: Assets.ImageName.Back.seatedCableRow.rawValue),
                // Горизонтальная тяга в тренажёре
                
                Exercise(title: "Low Cable Row", imageName: Assets.ImageName.Back.lowCableRow.rawValue),
                // Тяга нижнего блока к поясу
                
                Exercise(title: "Back Extension", imageName: Assets.ImageName.Back.backExtension.rawValue)
                // Гиперэкстензия
            ]
        ),

        // MARK: - Ноги и ягодицы
        ActivityCategory(
            category: .legsGlutes,
            exercises: [
                Exercise(title: "Barbell Squat", imageName: Assets.ImageName.LegsGluts.barbellSquat.rawValue),
                // Присед со штангой

                Exercise(title: "Leg Press", imageName: Assets.ImageName.LegsGluts.legPress.rawValue),
                // Жим ногами

                Exercise(title: "Romanian Deadlift", imageName: Assets.ImageName.LegsGluts.romanianDeadlift.rawValue),
                // Румынская тяга

                Exercise(title: "Lunges", imageName: Assets.ImageName.LegsGluts.lunges.rawValue),
                // Выпады

                Exercise(title: "Lying Leg Curl", imageName: Assets.ImageName.LegsGluts.lyingLegCurl.rawValue),
                // Сгибание ног лёжа

                Exercise(title: "Leg Extension", imageName: Assets.ImageName.LegsGluts.legExtension.rawValue),
                // Разгибание ног
            ]
        )
//
//        // MARK: - Грудь
//        ActivityCategory(
//            category: .chest,
//            exercises: [
//                Exercise(title: "Жим штанги лёжа", icon: "dumbbell"),
//                Exercise(title: "Жим гантелей лёжа", icon: "dumbbell"),
//                Exercise(title: "Жим на наклонной скамье", icon: "dumbbell"),
//                Exercise(title: "Сведения в кроссовере", icon: "figure.strengthtraining.functional"),
//                Exercise(title: "Отжимания", icon: "figure.strengthtraining.traditional")
//            ]
//        ),
//
//        // MARK: - Плечи
//        ActivityCategory(
//            category: .shoulders,
//            exercises: [
//                Exercise(title: "Жим гантелей над головой", icon: "dumbbell"),
//                Exercise(title: "Жим штанги стоя", icon: "dumbbell"),
//                Exercise(title: "Подъёмы гантелей в стороны", icon: "figure.arms.open"),
//                Exercise(title: "Разведение в наклоне", icon: "figure.arms.open")
//            ]
//        ),
//
//        // MARK: - Руки
//        ActivityCategory(
//            category: .arms,
//            exercises: [
//                Exercise(title: "Сгибание рук со штангой", icon: "dumbbell"),
//                Exercise(title: "Сгибание гантелей (молот)", icon: "dumbbell"),
//                Exercise(title: "Разгибание на блоке", icon: "figure.strengthtraining.functional"),
//                Exercise(title: "Французский жим", icon: "dumbbell")
//            ]
//        ),
//
//        // MARK: - Пресс
//        ActivityCategory(
//            category: .core,
//            exercises: [
//                Exercise(title: "Скручивания", icon: "figure.core.training"),
//                Exercise(title: "Подъёмы ног в висе", icon: "figure.core.training"),
//                Exercise(title: "Планка", icon: "figure.core.training")
//            ]
//        )
    ]
}
