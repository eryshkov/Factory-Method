//
//  Squarts.swift
//  Factory Method
//
//  Created by Evgeniy Ryshkov on 18/01/2019.
//  Copyright © 2019 Evgeniy Ryshkov. All rights reserved.
//

import Foundation

class Squarts: Exercise {
    var name: String = "Приседания"
    
    var type: String = "Упражнение для ног"
    
    func start() {
        print("Начинаем \(name.lowercased())")
    }
    
    func stop() {
        print("Заканчиваем \(name.lowercased())")
    }
    
}
