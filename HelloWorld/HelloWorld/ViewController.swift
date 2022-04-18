//
//  ViewController.swift
//  HelloWorld
//
//  Created by 이상준 on 2022/04/18.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var uiTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sayHello(_ sender: Any) {
        self.uiTitle.text = "Hello World!"
    }
    
}

