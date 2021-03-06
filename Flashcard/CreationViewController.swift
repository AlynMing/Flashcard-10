//
//  CreationViewController.swift
//  Flashcard
//
//  Created by Rashmi Sharma on 3/4/20.
//  Copyright © 2020 Rashmi Sharma. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {
    
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
    
    @IBOutlet weak var answer1: UITextField!
    @IBOutlet weak var answer2: UITextField!
    @IBOutlet weak var answer3: UITextField!
    var flashcardsController: ViewController!
    
    var initialQuestion: String?
    var initialAnswer: String?
    var initialAnswer1: String?
    var initialAnswer2: String?
    var initialAnswer3: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        questionTextField.text = initialQuestion
        answerTextField.text = initialAnswer
        answer1.text = initialAnswer1
        answer2.text = initialAnswer2
        answer3.text = initialAnswer3
        
    }
    

    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        // assign strings in question and answer fields to variables
        let questionText = questionTextField.text
        let answerText = answerTextField.text
    
        
        let ans1Text = answer1.text
        let ans2Text = answer2.text
        let ans3Text = answer3.text
        
        
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        let alert = UIAlertController(title: "Missing Text", message: "Question or Answer field left blank", preferredStyle: .alert)
        alert.addAction(okAction)
       
        if (questionText == nil || answerText == nil || ans1Text == nil || ans2Text == nil || ans3Text == nil ||  questionText!.isEmpty || answerText!.isEmpty || ans1Text!.isEmpty || ans2Text!.isEmpty || ans3Text!.isEmpty ){
            present(alert, animated: true)
        }
        else{
            // call updateFlashcard with above variables as arguments
            
            var isExisting = false
            if initialQuestion != nil {
                isExisting = true
            }
            flashcardsController.updateFlashcard(question: questionText!, answer: answerText!, answer1: ans1Text!, answer2: ans2Text!, answer3: ans3Text!, isExisting: isExisting)
            
            // dismiss this view
            dismiss(animated: true)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
