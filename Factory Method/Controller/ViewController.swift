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
    
    @objc func runExercises() {
        for ex in exerciseArray {
            
            ex.start()
            ex.stop()
        }
    }

    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Exercises"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Do Exs", style: .plain, target: self, action: #selector(runExercises))
        
        createExercise(exName: .jumping)
        createExercise(exName: .squarts)
        createExercise(exName: .swingPress)
        
        runExercises()
    }


}

