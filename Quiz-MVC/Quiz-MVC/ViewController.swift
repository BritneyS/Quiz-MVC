//
//  ViewController.swift
//  Quiz-MVC
//
//  Created by Britney Smith on 9/4/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

/*
 Get your QuestionBank data into Question objects
 Put those Question objects in your quiz array
 Display a question to the user, and display the matching answer upon request (you do not need to accept user input for the purposes of this exercise)
 Notify the user when the quiz is complete
 */

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var showAnswerButton: UIButton!
    
    @IBOutlet weak var nextQuestionButton: UIButton!
    
    var quiz:[Question] = []
    var currentQuestionIndex = 0
    
    
    func getQuestions() {
        let bank = QuestionBank()
        //questions = array of questions in bank
        for item in bank.questionsAndAnswers {
            let newQuestion = Question(question: item.key, answer: item.value)
            quiz.append(newQuestion)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startGame() {
        clearAnswer()
        getQuestions()
        resetProperties()
        setFirstQuestion()
    }
    
    func resetProperties(){
        currentQuestionIndex = 0
    }
    
    func clearAnswer(){
        answerLabel.text = ""
    }

    func setFirstQuestion() {
        setQuestion(questionNum: self.currentQuestionIndex)
    }
    
    func setQuestion(questionNum:Int) {
        if questionNum < quiz.count {
            questionLabel.text = quiz[questionNum].question
        }
    }
    
    func setAnswer(answerNum:Int) {
        if answerNum < quiz.count {
            answerLabel.text = quiz[answerNum].answer
        }
    }
    
    func gameOver() {
     showAlert()
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Quiz Complete!", message: "🤪", preferredStyle: .alert)
        let continueAction = UIAlertAction(title: "Continue", style: .default, handler: {(action:UIAlertAction!) in self.startGame()})
        alert.addAction(continueAction)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func showAnswer(_ sender: UIButton) {
        setAnswer(answerNum: self.currentQuestionIndex)
    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        if self.currentQuestionIndex == 3 {
            gameOver()
        } else {
            self.currentQuestionIndex+=1
        }
        setQuestion(questionNum: self.currentQuestionIndex)
        clearAnswer()
    }
    
    

}

