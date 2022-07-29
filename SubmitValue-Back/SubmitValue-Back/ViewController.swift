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


    override func viewWillAppear(_ animated: Bool) {
//        if let email = paramEmail {
//            self.resultEmail.text = email
//        }
//
//        if let update = paramUpdate  {
//            self.resultUpdate.text = update==true ? "자동갱신" : "자동갱신안함"
//        }
//
//        if let interval = paramInterval {
//            self.resultInterval.text = "\(Int(interval))분마다"
//        }
        
        // AppDelegate 객체의 인스턴스를 가져옴
//        let ad = UIApplication.shared.delegate as? AppDelegate
//
//        if let email = ad?.paramEmail {
//                            resultEmail.text = email
//                        }
//
//        if let update = ad?.paramUpdate  {
//                    resultUpdate.text = update==true ? "자동갱신" : "자동갱신안함"
//                }
//
//        if let interval = ad?.paramInterval {
//                    resultInterval.text = "\(Int(interval))분마다"
//                }
        
        let ud = UserDefaults.standard
        
        if let email = ud.string(forKey: "email") {
            resultEmail.text = email
        }
        
        let update = ud.bool(forKey: "isUpdate")
        resultUpdate.text = (update == true ? "자동갱신" : "자동갱신안함")
        
        let interval = ud.double(forKey: "interval")
        resultInterval.text = "\(Int(interval))분마다"
        
        
    }


}

