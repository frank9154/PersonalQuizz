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
   
    
   /* init(labelOne: UILabel!, labelTwo: UILabel!, answersChosenForResults: [Answer]) {
        self.labelOne = labelOne
        self.labelTwo = labelTwo
        self.answersChosenForResults = answersChosenForResults
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mostFrequentAnimal(in: answersChosenForResults)
        
        labelOne.text = "Вы - \(String(describing: mostFrequentAnimal(in: answersChosenForResults)))"
        //labelOne.text = "Вы - \(counts.)"
        
    }
    
    func mostFrequentAnimal(in answersChosenForResults: [Answer]) -> Animal? {
        let counts = answersChosenForResults.reduce(into: [:]) { counts, answer in
            counts[answer.animal, default: 0] += 1
        }
        
        if let (mostFrequentAnimal, _) = counts.max(by: { $0.1 < $1.1 }) {
            return mostFrequentAnimal
        } else {
            return nil
        }
    }

    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
