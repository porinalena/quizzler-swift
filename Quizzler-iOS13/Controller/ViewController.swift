//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        if questionNum + 1 < quiz.count {
            questionNum += 1
        } else {
            questionNum = 0
        }
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (timer) in
            self.updateUI()
        }
    }
    
        func updateUI() {
            questionLabel.text = quiz[questionNum].text
            trueButton.backgroundColor = UIColor.clear
            falseButton.backgroundColor = UIColor.clear
            progressBar.progress = Float(questionNum + 1)/Float(quiz.count)
        }
    
}

