//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Rahmetullah on 19.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var askedQuestions = 0
    let maxQuestion = 10
    override func viewDidLoad() {
      
        super.viewDidLoad()
        
        countries += ["estonia","russia", "uk", "us","ireland", "monaco", "poland","france","nigeria","germany","spain","italy"]
        button1.layer.borderWidth  = 1
        button2.layer.borderWidth  = 1
        button3.layer.borderWidth  = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button1.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    // Shows the flags in random order
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]),
        for: .normal)
        button2.setImage(UIImage(named: countries[1]),
        for: .normal)
        button3.setImage(UIImage(named: countries[2]),
        for: .normal)
        title = "\(countries[correctAnswer].uppercased()) Score:\(score)"
        
        
    }
    // Starts new game
    func newGame(action: UIAlertAction! = nil) {
        score = 0
        askedQuestions = 0
        askQuestion()
        
        }
    //Button actions
    @IBAction func buttonTapped(_ sender: UIButton) {
      
        var title: String
        if sender.tag == correctAnswer {
            title = "Correct!"
            score += 1
            askedQuestions += 1

        } else {
            title = "Wrong :( That is flag of \(countries[sender.tag].uppercased()) "
            score -= 1
            askedQuestions += 1

        }
        //If the number of asked questions more than 10 it shows alert and starts new game 
        if askedQuestions < maxQuestion {
            let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
       
        } else {
            let finalController = UIAlertController(title: "End of the Game", message: "Your final score \(score)", preferredStyle: .alert)
            
            finalController.addAction(UIAlertAction(title: "Start Over", style: .default, handler: newGame))
            present(finalController, animated: true)
            
        }
      
    
        
       
    
}

}

