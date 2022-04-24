//
//  ViewController.swift
//  Scene-Trans01
//
//  Created by 이상준 on 2022/04/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveNext(_ sender: UIButton) {
        
        // 이동할 뷰 컨트롤러 객체를 StoryboardID 정보를 이용하여 잠조, instantiateViewController: 인자값으로 입력받은 아이디를 이용하여 뷰컨트롤러를 찾고 그 뷰 컨트롤러에 대한 인스턴스를 생성
        
//        let uvc = self.storyboard!.instantiateViewController(withIdentifier: "SecondVC")
//
        //강제 해제했던 것을 ?를 붙여 옵셔널 체인으로 만든 후 guard 구문으로 사용하여 안정성 증가
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else { return }
        
        //화면 전환할 때의 애니메이션 타입
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        
        //인자값으로 뷰 컨트롤러 인스턴스를 넣고 프레젠트 메소드 호출
        self.present(uvc, animated: true)
        
    }
    
}

