//
//  QuestionViewController.swift
//  Personality Quiz 1
//
//  Created by Robert Campos on 5/2/23.
//

import UIKit

class QuestionViewController: UIViewController {
    var answerChosen : [Answer] = []
    var questions : [Question] = [
        Question(text: "Which food do you like the most?",
                 type: .single, answers: [
                    Answer(text: "Steak", type: .dog),
                    Answer(text: "Fish", type: .cat),
                    Answer(text: "Carrots", type: .rabbit),
                    Answer(text: "Corn", type: .turtle),
                 ]),
        Question(text: "Which activities do you enjoy?",
                 type: .single, answers: [
                    Answer(text: "Swimming", type: .dog),
                    Answer(text: "Sleeping", type: .cat),
                    Answer(text: "Cuddling", type: .rabbit),
                    Answer(text: "Eating", type: .turtle),
                 ]),
        Question(text: "How much do you enjoy car rides",
                 type: .single, answers: [
                    Answer(text: "I dislike them", type: .dog),
                    Answer(text: "I get a little nervous", type: .cat),
                    Answer(text: "I barely notice them", type: .rabbit),
                    Answer(text: "I love them", type: .turtle),
                 ])
    ]
    var questionIndex = 0 //The index of the current question
    
    
    //outlets
    
    @IBOutlet weak var rangeQuestionView: UIStackView!
    @IBOutlet weak var multipleQuestionView: UIStackView!
    @IBOutlet weak var singleQuestionView: UIStackView!
    //Question label
    @IBOutlet var questionLabel: UILabel!

    //Question Progress view
    @IBOutlet var questionProgressView : UIProgressView!
    //Single Stack View outlets
    @IBOutlet var singleButton1 : UIButton!
    @IBOutlet var singleButton2 : UIButton!
    @IBOutlet var singleButton3 : UIButton!
    @IBOutlet var singleButton4 : UIButton!
    //Multiple Stack View outlets
    @IBOutlet var multipleLabel1 : UILabel!
    @IBOutlet var multipleLabel2 : UILabel!
    @IBOutlet var multipleLabel3 : UILabel!
    @IBOutlet var multipleLabel4 : UILabel!
    //Multi Switch Outlets
    @IBOutlet var multiSwitch1 : UISwitch!
    @IBOutlet var multiSwitch2 : UISwitch!
    @IBOutlet var multiSwitch3 : UISwitch!
    @IBOutlet var multiSwitch4 : UISwitch!
    
    
    //Range Stack View outlets
    @IBOutlet var rangedSlider: UISlider!
    @IBOutlet var rangedLabel1: UILabel!
    @IBOutlet var rangedLabel2: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    func updateUI(){
        //disable all stack views
        singleQuestionView.isHidden = true
        multipleQuestionView.isHidden = true
        rangeQuestionView.isHidden = true
        
        //set the title
        navigationItem.title = "questions #\(questionIndex)"
        
        //set the current question
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        
        //set the progress
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        //animate the progress
        questionProgressView.setProgress(totalProgress, animated: true)
        
        //activate the view for this type
        switch currentQuestion.type{
        
        case .single:
            updateSingleStack(using: currentAnswers)
            
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
            
        }
        
    }
    func updateSingleStack(using answers: [Answer]) {
        singleQuestionView.isHidden = false
        //set up the answers
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    func updateMultipleStack(using answers: [Answer]) {
        multipleQuestionView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        multipleLabel1.text = answers[0].text
        multipleLabel2.text = answers[1].text
        multipleLabel3.text = answers[2].text
        multipleLabel4.text = answers[3].text
    }
    func updateRangedStack(using answers: [Answer]) {
        rangeQuestionView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        switch sender{
        case singleButton1:
            answerChosen.append(currentAnswers[0])
            
        case singleButton2:
            answerChosen.append(currentAnswers[1])
            
        case singleButton3:
            answerChosen.append(currentAnswers[2])
            
        case singleButton4:
            answerChosen.append(currentAnswers[3])
            
        default:
            break
        }
        nextQuestion()
    }
    @IBAction func multipleAnswerButtonPressed(){
        let currentAnswers = questions[questionIndex].answers
    
        if multiSwitch1.isOn{
            answerChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn{
            answerChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn{
            answerChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn{
            answerChosen.append(currentAnswers[3])
        }
        nextQuestion()
    }
    @IBAction func rangedAnswerButtonPressed(){
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answerChosen.append(currentAnswers[index])
        nextQuestion()
    }
    func nextQuestion (){
        questionIndex += 1
        
        if questionIndex < questions.count{
            updateUI()
        } else{
            performSegue(withIdentifier: "Results", sender: nil)
        }
    }
    
    @IBSegueAction func showResults(_ coder: NSCoder) -> UIViewController? {
        return ResultsViewController(coder: coder, responses: answerChosen)
    }
}
