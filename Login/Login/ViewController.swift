//
//  ViewController.swift
//  Login
//
//  Created by Robert Campos on 2/27/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var forgotUserNameButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    
    segue.destination.navigationItem.title = userName.text
    }
    
    
    @IBAction func ForgottenUsername(_ sender: UIButton) {
        performSegue(withIdentifier: "ForgottenUsernameOrPassword",sender: sender)
    }
    
    @IBAction func ForgottenPassword(_ sender: UIButton) {
    }
}



