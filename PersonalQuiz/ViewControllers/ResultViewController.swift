//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 29.11.2023.
//

import UIKit

final class ResultViewController: UIViewController {

    @IBOutlet var labelOne: UILabel!
    @IBOutlet var labelTwo: UILabel!
    
    
    var answersChosenForResults: [Answer] = []
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mostFrequent = mostFrequentAnimal(in: answersChosenForResults)
        
        labelOne.text = "Вы - \(mostFrequent.rawValue)"
        labelTwo.text = "\(mostFrequent.definition)"
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    func mostFrequentAnimal(in answersChosenForResults: [Answer]) -> Animal {
        let counts = answersChosenForResults.reduce(into: [:]) { counts, answer in
            counts[answer.animal, default: 0] += 1
            
        }
        print(counts)
        
        if let (mostFrequentAnimal, _) = counts.max(by: { $0.1 < $1.1 }) {
            return mostFrequentAnimal
        } else {
            return .cat
        }
    }
    
    
   

    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
