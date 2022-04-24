//
//  ViewController.swift
//  Scene-Trans02
//
//  Created by 이상준 on 2022/04/24.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func moveByNavi(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else {
            return
        }
        
        self.navigationController?.pushViewController(uvc, animated: true)
    }
    
    
    @IBAction func movePresent(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else {
            return
        }
        
        self.present(uvc, animated: true)
        
    }
    
}

