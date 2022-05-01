//
//  FormViewController.swift
//  SubmitValue-Back
//
//  Created by 이상준 on 2022/04/30.
//

import UIKit

class FormViewController: UIViewController {
    
    
    @IBOutlet var email: UITextField!
    @IBOutlet var isUpdate: UISwitch!
    @IBOutlet var interval: UIStepper!
    
    
    override func viewDidLoad() {
         super.viewDidLoad()
    }
   
    
    @IBAction func onSubmit(_ sender: UIButton) {
//        let preVC = self.presentingViewController
//        guard let vc = preVC as? ViewController else { return }
        
        //값 전달
//        vc.paramEmail = self.email.text
//        vc.paramUpdate = self.isUpdate.isOn
//        vc.paramInterval = self.interval.value
        
        //이전 화면으로 복귀
//        self.presentingViewController?.dismiss(animated: true)
        
        
        //AppDelegate 객체의 인스턴스를 가져옴
//        let ad = UIApplication.shared.delegate as? AppDelegate
//
//        ad?.paramEmail = self.email.text
//        ad?.paramUpdate = self.isUpdate.isOn
//        ad?.paramInterval = self.interval.value
    
        let ud = UserDefaults.standard
        
        ud.set(self.email.text, forKey: "email")
        ud.set(self.isUpdate.isOn, forKey: "isUpdate")
        ud.set(self.interval.value, forKey: "interval")
        
        self.presentingViewController?.dismiss(animated: true)
    }
    
}
