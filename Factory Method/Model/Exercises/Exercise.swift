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
}

extension Exercise {
    func start() {
        print("Начинаем \(name.lowercased())")
    }
    
    func stop() {
        print("Заканчиваем \(name.lowercased())")
    }
}
