//
//  ListViewController.swift
//  Table-CellHeight
//
//  Created by 이상준 on 2022/05/14.
//

import UIKit

class ListViewController: UITableViewController {
    
    // 테이블 뷰에 연결될 데이터를 저장하는 배열
    var list = [String]()
    
    @IBAction func add(_ sender: Any) {
        
        let alert = UIAlertController(title: "목록 입력", message: "추가될 글을 작성해주세요", preferredStyle: .alert)
        
        // 알림창에 입력폼을 추가
        alert.addTextField { (tf) in
            tf.placeholder = "내용을 입력하세요"
        }
        
        let ok = UIAlertAction(title: "OK", style: .default) { (_) in
            //알림창의 0번째 입력필드에 값이 있다면
            if let title = alert.textFields?[0].text {
                // 배열에 입력된 값을 추가하고 테이블을 갱신
                self.list.append(title)
                self.tableView.reloadData()
            }
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        //알림창 객체에 버튼 등록
        alert.addAction(ok)
        alert.addAction(cancel)
        
        //알림창 띄우기
        self.present(alert, animated: false)
    }
}
