//
//  ViewController.swift
//  PersonalityQuiz
//
//  Created by Robert Campos on 4/21/23.
//

import UIKit

class introVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startQuizPressed(_ sender: Any) {
        performSegue(withIdentifier: "beginPersonalityQuiz", sender: nil)
    }
    
}

