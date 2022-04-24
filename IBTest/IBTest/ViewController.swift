//
//  ViewController.swift
//  IBTest
//
//  Created by 이상준 on 2022/04/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet var uiTitle01: UILabel!
    
    @IBOutlet var uiTitle02: UILabel!
    
    @IBOutlet var uiTitle03: UILabel!
    
    @IBOutlet var uiTitle04: UILabel!
    
    @IBAction func clickBtn01(_ sender: Any) {
        self.uiTitle01.text = "Button01 Clicked"
    }
    
    @IBAction func clickBtn02(_ sender: UIButton) {
        self.uiTitle02.text = "Button02 Clicked"
    }
    
    @IBAction func clickBtn03(_ sender: UIButton){
        self.uiTitle03.text = "Button03 Clicked"
        
    }
    
    @IBAction func clickBtn04(_ sender: UIButton){
        self.uiTitle04.text = "Button04 Clicked"
    }
}

