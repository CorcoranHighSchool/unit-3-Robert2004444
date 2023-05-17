//
//  ViewController.swift
//  LifeCycle
//
//  Created by Robert Campos on 3/21/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ViewController - View Did Load");
    }
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        print("ViewController - View Will Appear")
    }
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        print("ViewController - View Did Appear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ViewController - View did Disappear")
    }
}

