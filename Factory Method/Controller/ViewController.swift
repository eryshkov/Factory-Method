//
//  ViewController.swift
//  Factory Method
//
//  Created by Evgeniy Ryshkov on 18/01/2019.
//  Copyright © 2019 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: -
    var exerciseArray = [Exercise]()
    var delayTimeBetweenExs: TimeInterval = 2
    var delayTimeForEx: TimeInterval = 3
    
    //MARK: -
    func createExercise(exName: ExerciseType) {
        let newExercice = ExerciseFactory.defaultFactory.createExercise(name: exName)
        
        exerciseArray.append(newExercice)
    }
    
    @objc func runExercises() {
        for (index, ex) in exerciseArray.enumerated() {
            
            _ = Timer.scheduledTimer(withTimeInterval: delayTimeBetweenExs * Double(index) + delayTimeForEx * Double(index), repeats: false) { (_) in
                ex.start()
            }
            
            _ = Timer.scheduledTimer(withTimeInterval: delayTimeForEx * Double(index + 1) + delayTimeBetweenExs * Double(index), repeats: false, block: { (_) in
                ex.stop()
            })
        }
    }

    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Exercises"
        
        createExercise(exName: .jumping)
        createExercise(exName: .squarts)
        createExercise(exName: .swingPress)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Do Exs", style: .plain, target: self, action: #selector(runExercises))

    }


}

