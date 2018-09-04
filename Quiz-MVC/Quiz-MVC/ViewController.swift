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
        getQuestions()
        resetProperties()
        setFirstQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        questionLabel.text = quiz[questionNum].question
        
    }
//    func displayQuestion(question:String, questionNum:Int) {
//        questionLabel.text = loadQuestion(questionNum: questionNum)
//    }
    
    func setAnswer(answerNum:Int) {
        answerLabel.text = quiz[answerNum].answer
    }
    
//    func displayAnswer(answer:String, answerNum:Int) {
//        answerLabel.text = loadAnswer(answerNum: answerNum)
//    }
    
    @IBAction func showAnswer(_ sender: UIButton) {
        setAnswer(answerNum: self.currentQuestionIndex)
    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        self.currentQuestionIndex+=1
        setQuestion(questionNum: self.currentQuestionIndex)
        clearAnswer()
    }
    
    

}

