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
    
    //MARK: -
    func createExercise(exName: ExerciseType) {
        let newExercice = ExerciseFactory.defaultFactory.createExercise(name: exName)
        
        exerciseArray.append(newExercice)
    }
    
    func runExercises() {
        for ex in exerciseArray {
            
            ex.start()
            ex.stop()
        }
    }

    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createExercise(exName: .jumping)
        createExercise(exName: .squarts)
        createExercise(exName: .swingPress)
        
        runExercises()
    }


}

