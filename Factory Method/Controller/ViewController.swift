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
    @IBOutlet weak var processLabel: UILabel!
    
    //MARK: -
    var exerciseArray = [Exercise]()
    var delayTimeBetweenExs: TimeInterval = 2
    var delayTimeForEx: TimeInterval = 3
    var activityIndicator: UIActivityIndicatorView  = {
        let actInd = UIActivityIndicatorView(style: .gray)
        actInd.hidesWhenStopped = true
        return actInd
    }()
    
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
        
        activityIndicator.startAnimating()
        
        let allExsTime = Double(exerciseArray.count) * (delayTimeForEx + delayTimeBetweenExs) - delayTimeBetweenExs
        
        _ = Timer.scheduledTimer(withTimeInterval: allExsTime, repeats: false, block: {[unowned self] (_) in
            self.activityIndicator.stopAnimating()
        })
    }

    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Exercises"
        
        createExercise(exName: .jumping)
        createExercise(exName: .squarts)
        createExercise(exName: .swingPress)
        
        let doKey = UIBarButtonItem(title: "Do Exs", style: .plain, target: self, action: #selector(runExercises))
        let activity = UIBarButtonItem(customView: activityIndicator)
        navigationItem.rightBarButtonItems = [doKey, activity]

    }


}

