//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by 이상준 on 2022/05/14.
//

import UIKit
import Foundation

class ListViewController: UITableViewController {

    var page = 1 // 현재까지 읽어온 데이터의 페이지 정보
    
    // lazy 키워드 사용이유
    // 1.미리 생성하지 않고 변수가 참조되는 시점에 맞추어 초기화되므로 메모리 낭비를 줄여줌
    // 2. lazy 키워드를 붙이지 않은 프로퍼티는 다른 프로퍼티를 참조할 수 없기 때문
    lazy var list: [MovieVO] = {
        var datalist = [MovieVO]()
        return datalist
    }()
    
    @IBOutlet var moreBtn: UIButton!
    
    @IBAction func more(_ sender: Any) {
        // 현재 페이지 값에 1을 추가
        self.page += 1
        self.callMovieApI()
        self.tableView.reloadData()
    }
    
    override func viewDidLoad(){
        self.callMovieApI()
    }
    
    
    func callMovieApI() {
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=\(self.page)&count=30&genreId=&order=releasedateasc"
        let apiURL: URL! = URL(string: url)
        
        // REST API 호출
        let apidata = try! Data(contentsOf: apiURL)
        
        // 데이터 전송 결과를 로그로 출력
//        let log = NSString(data: apidata, encoding: String.Encoding.utf8.rawValue) ?? "데이터 가 없어요..."
//        NSLog("API Result = \(log)")
        
        // JSON 객체를 파싱하여 NSDictionary 객체로 받음
        do {
            let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
            
            let hoppin = apiDictionary["hoppin"] as! NSDictionary // NSDictionary 타입으로 캐스팅
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            
            // Iterator 처리를 하면서 API 데이터를 MovieVO 객체에 저장
            for row in movie {
                
                // 순회 상수를 NSDictionary 타입으로 캐스팅
                let r = row as! NSDictionary
                
                // 테이블 뷰 리스트를 구성한 데이터 형식
                let mvo = MovieVO()
                
                // movie 배열의 각 데이터를 mvo 상수의 속성에 대입
                mvo.title = r["title"] as? String
                mvo.description = r["genreNames"] as? String
                mvo.thumbnail = r["thumbnailImage"] as? String
                mvo.detail = r["linkUrl"] as? String
                mvo.rating = ((r["ratingAverage"] as! NSString).doubleValue)
                
                // list 배열에 추가
                self.list.append(mvo)
                
                // 전체 데이터 카운트
                let totalCount = (hoppin["totalCount"] as? NSString)!.integerValue
                
                //totalCount가 읽어온 데이터 크기와 같거나 클 경우 더보기 버튼을 막음.
                if(self.list.count >= totalCount) {
                    self.moreBtn.isHidden = true
                }
            }
        } catch {
            NSLog("Parse Error!")
        }
    }
    
    func getThumbnailImage(_ index: Int) -> UIImage {
        let mvo = self.list[index]
        
        if let savedImage = mvo.thumbnailImage {
            return savedImage
        } else {
            let url: URL! = URL(string: mvo.thumbnail!)
            let imageData = try! Data(contentsOf: url)
            mvo.thumbnailImage = UIImage(data: imageData)
            
            return mvo.thumbnailImage!
        }
    }
    
    // 테이블 행 개수를 반환하는 메소드
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    // 테이블 뷰 행을 구성하는 메소드
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 주어진 행에 맞는 데이터 소스를 읽어옴
        let row = self.list[indexPath.row]
        
        // 테이블 셀 객체를 직접 생성하는 대신 큐로부터 가져옴
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell

        //데이터 소스에 저장된 값을 각 레이블 변수에 할당
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
        
        DispatchQueue.main.async {
            cell.thumbnail.image = self.getThumbnailImage(indexPath.row)
        }
        
        return cell
    }
    
    //테이블 셀 터치시 발생하는 메소드
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row) 번째 행입니다.")
    }
}

// MARK: - 화면 전환시 값을 넘겨주기 위한 세그웨이 관련 처리
extension ListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 실행된 세그웨이 식별자가 "segue_detail"이라면
        if segue.identifier == "segue_detail" {
            // sender 인자를 캐스팅하여 테이블 셀 객체로 변환한다.
            let cell = sender as! MovieCell
            
            // 사용자가 클릭한 행을 찾고
            let path = self.tableView.indexPath(for: cell)
            
            // API 영화 데이터 배열 중에 선택된 행에 대한 데이터 추출
            let movieInfo = self.list[path!.row]
            
            // 행 정보를 통해 선택된 영화 데이터를 찾은 후, 목적지 뷰 컨트롤러의 mvo 변수에 대입
            let detailVC = segue.destination as? DetailViewController
            detailVC?.mvo = movieInfo
        }
    }
}


