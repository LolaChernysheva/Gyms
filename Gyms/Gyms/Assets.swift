//
//  Assets.swift
//  Gyms
//
//  Created by Lolita Chernysheva on 02.03.2026.
//  
//

enum Assets {
    enum ImageName {
        enum Back: String {
            case deadlift
            case romanianDeadlift = "romanian-deadlift"
            case backExtension = "back-extension"
            case barbellBentOverRow = "barbell-bent-over-row"
            case latPulldown = "lat-pulldown"
            case lowCableRow = "low-cable-row"
            case oneArmDumbbellRow = "one-arm-dumbbell-row"
            case pullUp = "pull-up"
            case seatedCableRow = "seated-cable-row"
        }
        
        enum LegsGluts: String {
            case barbellSquat = "barbell-squat"
            case legExtension = "leg-extension"
            case legPress = "leg-press"
            case lunges = "lunges"
            case lyingLegCurl = "lying-leg-curl"
            case romanianDeadlift = "romanian-deadlift"
        }
    }
}
