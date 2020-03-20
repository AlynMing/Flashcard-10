//
//  ViewController.swift
//  Flashcard
//
//  Created by Rashmi Sharma on 2/15/20.
//  Copyright © 2020 Rashmi Sharma. All rights reserved.
//

import UIKit

struct Flashcard {
    
    var question: String
    var answer: String
    var answer1: String
    var answer2: String
    var answer3: String
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var answerOne: UIButton!
    @IBOutlet weak var answerTwo: UIButton!
    @IBOutlet weak var answerThree: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    var flashcards = [Flashcard]()
    var currentIndex = 0
    
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
        
        readSavedFlashcards()
        
        
        if (flashcards.count == 0) {
            updateFlashcard(question: "What is the tallest building in the world?", answer: "Burj Khalifa", answer1: "Entisar Tower", answer2: "Burj Khalifa", answer3: "China Zun", isExisting: false)
        }
        else{
            updateLabels()
            updateNextPrevButtons()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        let navigationController = segue.destination as! UINavigationController
        
        let creationController = navigationController.topViewController as! CreationViewController
        
        if segue.identifier == "EditSegue"{
            creationController.initialQuestion = frontLabel.text
            creationController.initialAnswer = backLabel.text
            creationController.initialAnswer1 = answerOne.titleLabel!.text
            creationController.initialAnswer2 = answerTwo.titleLabel!.text
            creationController.initialAnswer3 = answerThree.titleLabel!.text 
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
    
    func updateFlashcard(question: String, answer: String, answer1: String, answer2: String, answer3: String, isExisting: Bool) {
        
        let flashcard = Flashcard(question: question, answer: answer, answer1: answer1, answer2: answer2, answer3: answer3)
        
        if isExisting {
            flashcards[currentIndex] = flashcard
        }
        
        else{
            
            // frontLabel.text = flashcard.question
            // backLabel.text = flashcard.answer
            
            // add flashcard to array of flashcards
            flashcards.append(flashcard)
            print("Added new flashcard")
            print("We now have \(flashcards.count) flashcard(s)")
            
            currentIndex = flashcards.count-1
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
       
        
        updateNextPrevButtons()
        
        updateLabels()
        
        saveAllFlashcardsToDisk()
        
    }
    
    @IBAction func didTapOne(_ sender: Any) {
        if answerOne.titleLabel!.text == backLabel.text{
            frontLabel.isHidden = true
            answerOne.isHidden = false
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
            answerTwo.isHidden = false
        }
        else{
            answerTwo.isHidden = true
        }
    }
    
    @IBAction func didTapThree(_ sender: Any){
        //answerThree.isHidden = true
        if answerThree.titleLabel!.text == backLabel.text{
            frontLabel.isHidden = true
            answerThree.isHidden = false
        }
        else{
            answerThree.isHidden = true
        }
    }
    @IBAction func didTapOnNext(_ sender: Any) {
        
        frontLabel.isHidden = false
        answerOne.isHidden = false
        answerTwo.isHidden = false
        answerThree.isHidden = false
        // increment card index
        currentIndex = currentIndex + 1
        
        
        // update labels
        updateLabels()
        
        // update buttons
        updateNextPrevButtons()
    }
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        
        frontLabel.isHidden = false
        answerOne.isHidden = false
        answerTwo.isHidden = false
        answerThree.isHidden = false
        
        //decrement card index
        currentIndex = currentIndex - 1
        
        //update labels
        updateLabels()
        
        //update buttons
        updateNextPrevButtons()
        
    }
    
    func updateNextPrevButtons() {
        
        // disable next button if at end of array
        if currentIndex == flashcards.count-1 {
            nextButton.isEnabled = false
        }
        else{
            nextButton.isEnabled = true
        }
        
        // disable prev button if at beginning of array
        if currentIndex == 0 {
            prevButton.isEnabled = false
        }
        else{
            prevButton.isEnabled = true
        }
    }
    
    func updateLabels() {
        
        let currentFlashcard = flashcards[currentIndex]
        
        // update labels based on the which flashcard we're at
        frontLabel.text = currentFlashcard.question
        backLabel.text = currentFlashcard.answer
        
        answerOne.setTitle(currentFlashcard.answer1, for: .normal)
        answerTwo.setTitle(currentFlashcard.answer2, for: .normal)
        answerThree.setTitle(currentFlashcard.answer3, for: .normal)
        
    }
    
    
    func saveAllFlashcardsToDisk() {
        
        let dictionaryArray = flashcards.map { (card) -> [String: String] in return ["question": card.question, "answer": card.answer, "answer1": card.answer1, "answer2":card.answer2, "answer3": card.answer3]  }
        
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        
        print("Flashcards saved to UserDefaults")
    }
    
    func readSavedFlashcards() {
        
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]] {
        
            let savedCards = dictionaryArray.map { dictionary -> Flashcard in return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!, answer1: dictionary["answer1"] ?? "", answer2: dictionary["answer2"] ?? "", answer3: dictionary["answer3"] ?? "" )
                
                }
            
            flashcards.append(contentsOf: savedCards)
        }
    }
    
    func deleteCurrentFlashcard() {
        
        //delete current
        flashcards.remove(at: currentIndex)
        if currentIndex > flashcards.count - 1 {
            currentIndex = flashcards.count - 1
        }
        updateNextPrevButtons()
        updateLabels()
        saveAllFlashcardsToDisk()
        
    }
    @IBAction func didTapOnDelete(_ sender: Any) {
        
        let alert = UIAlertController(title: "Delete Flashcard", message: "Are you sure you want to delete it?", preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { action in
            self.deleteCurrentFlashcard()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    
    
}

