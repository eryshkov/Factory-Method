//
//  ExerciseFactory.swift
//  Factory Method
//
//  Created by Evgeniy Ryshkov on 18/01/2019.
//  Copyright © 2019 Evgeniy Ryshkov. All rights reserved.
//

import Foundation

//MARK: - Factory product types
enum ExerciseType {
    case jumping, squarts, swingPress
}

class ExerciseFactory {
    //MARK: - Singletone
    static let defaultFactory = ExerciseFactory()
    
    //MARK: - Factory method
    func createExercise(name: ExerciseType) -> Exercise {
        switch name {
            
        case .jumping:
            return Jumping()
        case .squarts:
            return Squarts()
        case .swingPress:
            return SwingPress()
        }
    }
    
    //MARK: -
    private init() {}
}
