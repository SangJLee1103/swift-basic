//
//  ResultViewController.swift
//  SubmitValue
//
//  Created by 이상준 on 2022/04/30.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultEmail: UILabel!
    @IBOutlet var resultUpdate: UILabel!
    @IBOutlet var resultInterval: UILabel!
    
    //값을 받을 변수들
    var paramEmail: String = ""
    var paramUpdate: Bool = false
    var paramInterval: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultEmail.text = paramEmail
        self.resultUpdate.text = (self.paramUpdate == true ? "자동갱신" : "자동갱신않함")
        self.resultInterval.text = "\(Int(paramInterval))분 마다 갱신"
    }
    
    @IBAction func onBack(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
}
