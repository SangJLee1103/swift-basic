//
//  ViewController.swift
//  SubmitValue
//
//  Created by 이상준 on 2022/04/30.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var email: UITextField!//이메일 주소 입력 텍스트 필드
    @IBOutlet var isUpdate: UISwitch! // 스위치
    @IBOutlet var interval: UIStepper! // 스테퍼
    
    @IBOutlet var isUpdateText: UILabel!
    @IBOutlet var intervalText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onSwitch(_ sender: UISwitch) {
        //sender는 스위치 컨트롤을 가르키는 값임
        if (sender.isOn == true) {
            self.isUpdateText.text = "갱신함"
        } else {
            self.isUpdateText.text = "갱신하지 않음"
        }
    }
    
    
    @IBAction func onStepper(_ sender: UIStepper) {
        let value = Int(sender.value)
        self.intervalText.text = "\(value)분 마다"
    }
    
    
    //네비게이션 컨트롤러 방식
    @IBAction func onSubmit(_ sender: UIButton) {
        
        //VC2의 인스턴스 생성
        // instantiateViewController 메소드를 호출하여 생성된 인스턴스는 기본적으로 UIVewController(VC 중 가장 상위 클래스) 타입이다. 그런데 paramEmail, paramUpdate 등의 프로퍼티는 ResultViewController 클래스에 정의되어 있기 때문에 그 타입으로 다운 캐스팅! 이를 통해 참조할 수 있음
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? ResultViewController else { return }
        
        rvc.paramEmail = self.email.text! //이메일
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
        
        self.navigationController?.pushViewController(rvc, animated: true)     
    }
    
    
    //segue를 통한 데이터 전달 및 화면전환
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //목적지 뷰 컨트롤러 인스턴스 읽어오기
        let dest = segue.destination
        
        guard let rvc = dest as? ResultViewController else { return }
        
        //값 전달
        rvc.paramEmail = self.email.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
        
    }
    
    @IBAction func onPerformSegue(_ sender: UIButton) {
        self.performSegue(withIdentifier: "ManualSubmit", sender: self)
    }
    
}

