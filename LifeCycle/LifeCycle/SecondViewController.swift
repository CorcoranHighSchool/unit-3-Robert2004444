//
//  SecondViewController.swift
//  LifeCycle
//
//  Created by Robert Campos on 3/27/23.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("SecondViewController - View Did Load")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SecondViewController - View Will appear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SecondViewController - View Did appear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("SecondViewController - View Will Disappear")
        }
    override func viewDidDisappear(_ animated: Bool){
        super.viewDidDisappear(animated)
    print("SecondViewController - View Did Disappear")
    
    }

   

}
