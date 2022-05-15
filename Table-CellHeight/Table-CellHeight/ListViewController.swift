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
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.estimatedRowHeight = 50
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // "cell" 아이디를 가진 셀을 읽어옴, 없으면 UITableViewCell 인스턴스 생성
        // A ?? B: A가 nil이 아닐 경우 옵셔널을 해제하고, nil일 경우 대신 B 값을 사용!!
        // cell 아이디를 가진 셀을 읽어와 옵셔널을 해제하되, 만약 그 값이 nil일 경우 UITableViewCell 인스턴스를 새로 생성!
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        
        
        //셀의 기본 텍스트 레이블 행 수 제한을 없앤다.
        cell.textLabel?.numberOfLines = 0
        
        //셀의 기본 텍스트 레이블에 배열 변수의 값을 할당한다.
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let row = self.list[indexPath.row]
//        
//        //높이 조절. 기본 높이 60 + 글의 길이가 30자를 넘어갈 때마다 20씩 높이 증가
//        let height = CGFloat(60 + (row.count / 30) * 20)
//        return height
//    }
}
