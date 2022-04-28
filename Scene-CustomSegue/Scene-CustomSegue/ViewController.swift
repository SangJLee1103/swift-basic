//
//  ViewController.swift
//  Scene-CustomSegue
//
//  Created by 이상준 on 2022/04/28.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        NSLog("segueway identifier: \(segue.identifier!)")
    }


}

