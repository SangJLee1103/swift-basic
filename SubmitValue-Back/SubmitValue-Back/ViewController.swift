//
//  ViewController.swift
//  SubmitValue-Back
//
//  Created by 이상준 on 2022/04/30.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var resultEmail: UILabel!
    @IBOutlet var resultUpdate: UILabel!
    @IBOutlet var resultInterval: UILabel!
    
    var paramEmail: String?
    var paramUpdate: Bool?
    var paramInterval: Double?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let email = paramEmail {
            resultEmail.text = email
        }
        
        if let update = paramUpdate  {
            resultUpdate.text = update==true ? "자동갱신" : "자동갱신안함"
        }
        
        if let interval = paramInterval {
            resultInterval.text = "\(Int(interval))분마다"
        }
    }


}

