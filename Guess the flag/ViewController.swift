//
//  ViewController.swift
//  Guess the flag
//
//  Created by user on 13/03/2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var currentScore = 0
    var totalNoOfQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
    
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()

    }
    
    func restartGame(){
        
        resetShowAlert(withTitle: "Congrats", withmessage: "your final score was \(currentScore) out of 10", uIAlertActionTitle: "Play again")
        
        totalNoOfQuestion = 0
        score = 0
        currentScore = 0
        
    }

    func askQuestion(action: UIAlertAction! = nil){
        if totalNoOfQuestion == 10 {
            restartGame()
        } else {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased()) Current score is \(currentScore)"
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        totalNoOfQuestion += 1
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            currentScore += 1
            
        } else {
            title = "Wrong"
            score -= 1
        }
        
        resetShowAlert(withTitle: title, withmessage: "Your score is \(currentScore)")
    }
    
    func resetShowAlert(withTitle title: String, withmessage message: String, uIAlertActionTitle: String = "Continue"){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
           
           ac.addAction(UIAlertAction(title: uIAlertActionTitle, style: .default, handler: askQuestion))
           
           present(ac, animated: true)
    }
}

