//
//  MovieVO.swift
//  MyMovieChart
//
//  Created by 이상준 on 2022/05/14.
//

import Foundation
import UIKit

class MovieVO {
    
    var thumbnail: String? // 영화 썸네일 이미지 주소
    var title: String? // 영화 제목
    var description: String? // 영화 설명
    var detail: String? // 상세정보
    var opendate: String? // 개봉일
    var rating: Double? // 평점
    
    // 메모이제이션 기법(데이터 재사용을 위한 캐싱 처리)
    var thumbnailImage: UIImage?
}
