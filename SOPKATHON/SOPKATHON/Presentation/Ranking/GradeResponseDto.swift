//
//  GradeResponseDto.swift
//  SOPKATHON
//
//  Created by saint on 2022/11/20.
//

import Foundation

struct GradeResponseDto: Codable {
    let name, image: String
    
    func convertToList() -> RankingModel {
        return RankingModel(gradeImage: self.image, name: self.name)
    }
}
