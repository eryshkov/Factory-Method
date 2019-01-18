//
//  Exercise.swift
//  Factory Method
//
//  Created by Evgeniy Ryshkov on 18/01/2019.
//  Copyright © 2019 Evgeniy Ryshkov. All rights reserved.
//

import Foundation

protocol Exercise {
    var name: String {get}
    var type: String {get}
    
    func start()
    func stop()
    func startText() -> String
    func stopText() -> String
}


// MARK: - Default implementation
extension Exercise {
    func start() {
        print(startText())
    }
    
    func stop() {
        print(stopText())
    }
    
    func startText() -> String {
        return "Начинаем \(name.lowercased())"
    }
    
    func stopText() -> String {
        return "Заканчиваем \(name.lowercased())"
    }
}
