//
//  TheaterViewController.swift
//  MyMovieChart
//
//  Created by 이상준 on 2022/07/30.
//

import Foundation
import UIKit
import MapKit

class TheaterViewController: UIViewController {
    
    var param: NSDictionary!
    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        self.navigationItem.title = self.param["상영관명"] as? String
        
        let lat = (param?["위도"] as! NSString).doubleValue
        let lng = (param?["경도"] as! NSString).doubleValue
        
        // 위도와 경도를 인수로 하는 2D 위치 정보 객체 정의
        let location = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        
        // 지도에 표시될 거리: 값의 단위는 m
        let regionRadus: CLLocationDistance = 100
        
        // 거리를 반영할 지역 정보를 조합한 지도 데이터를 생성
        let coordinateRegion = MKCoordinateRegion(center: location, latitudinalMeters: regionRadus, longitudinalMeters: regionRadus)
        
        // map 변수에 연결된 지도 객체에 데이터를 전달하여 화면에 표시
        self.map.setRegion(coordinateRegion, animated: true)
        
        // 위치를 표시해줄 객체를 생성하고, 앞에서 작성해준 위치값 객체를 할당
        let point = MKPointAnnotation()
        point.coordinate = location
        
        // 위치 표현값을 추가
        self.map.addAnnotation(point)
    }
}
