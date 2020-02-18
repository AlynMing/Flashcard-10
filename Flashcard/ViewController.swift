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

    
    @IBAction func didTapOnFlashcard(_ sender: Any) {
        
        
        if frontLabel.isHidden == true {
            frontLabel.isHidden = false
        }
        else{
        frontLabel.isHidden = true
        }
    }
    
    @IBAction func didTapOne(_ sender: Any) {
        answerOne.isHidden = true
    }
    
    @IBAction func didTapTwo(_ sender: Any) {
        frontLabel.isHidden = true
    }
    
    @IBAction func didTapThree(_ sender: Any){
        answerThree.isHidden = true
    }
}

