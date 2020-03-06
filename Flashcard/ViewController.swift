//
//  ViewController.swift
//  Flashcard
//
//  Created by Rashmi Sharma on 2/15/20.
//  Copyright © 2020 Rashmi Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var answerOne: UIButton!
    @IBOutlet weak var answerTwo: UIButton!
    @IBOutlet weak var answerThree: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        frontLabel.layer.cornerRadius = 20.0
        backLabel.layer.cornerRadius = 20.0
        card.layer.cornerRadius = 20.0
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
        frontLabel.clipsToBounds = true
        backLabel.clipsToBounds = true
        
        answerOne.backgroundColor = .clear
        answerOne.layer.cornerRadius = 20.0
        answerOne.layer.borderWidth = 3.0
        answerOne.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        answerTwo.backgroundColor = .clear
        answerTwo.layer.cornerRadius = 20.0
        answerTwo.layer.borderWidth = 3.0
        answerTwo.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        answerThree.backgroundColor = .clear
        answerThree.layer.cornerRadius = 20.0
        answerThree.layer.borderWidth = 3.0
        answerThree.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        let navigationController = segue.destination as! UINavigationController
        
        let creationController = navigationController.topViewController as! CreationViewController
        
        if segue.identifier == "EditSegue"{
            creationController.initialQuestion = frontLabel.text
            creationController.initialAnswer = backLabel.text
        }

        creationController.flashcardsController = self
    }

    
    @IBAction func didTapOnFlashcard(_ sender: Any) {
        
        
        if frontLabel.isHidden == true {
            frontLabel.isHidden = false
        }
        else{
        frontLabel.isHidden = true
        }
    }
    
    func updateFlashcard(question: String, answer: String, answer1: String, answer2: String, answer3: String) {
        frontLabel.text = question
        backLabel.text = answer
        
        answerOne.setTitle(answer1, for: .normal)
        answerTwo.setTitle(answer2, for: .normal)
        answerThree.setTitle(answer3, for: .normal)
        
        // buttons should be displayed again for new question
        answerOne.isHidden = false
        answerTwo.isHidden = false
        answerThree.isHidden = false
        
        // answer should be hidden for new question
        frontLabel.isHidden = false
        
    }
    
    @IBAction func didTapOne(_ sender: Any) {
        if answerOne.titleLabel!.text == backLabel.text{
            frontLabel.isHidden = true
        }
        else{
            answerOne.isHidden = true
        }
        //answerOne.isHidden = true
    }
    
    @IBAction func didTapTwo(_ sender: Any) {
        //frontLabel.isHidden = true
        if answerTwo.titleLabel!.text == backLabel.text{
            frontLabel.isHidden = true
        }
        else{
            answerTwo.isHidden = true
        }
    }
    
    @IBAction func didTapThree(_ sender: Any){
        //answerThree.isHidden = true
        if answerThree.titleLabel!.text == backLabel.text{
            frontLabel.isHidden = true
        }
        else{
            answerThree.isHidden = true
        }
    }
}

