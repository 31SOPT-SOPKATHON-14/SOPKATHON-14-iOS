//
//  RankingCollectionViewCell.swift
//  SOPKATHON
//
//  Created by saint on 2022/11/20.
//

import UIKit
import SnapKit
import SwiftyColor

import Then

class RankingCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "RankingCollectionViewCell"
    
    private let gradeImageView = UIImageView()
    private let nameLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 16.adjusted, weight: .medium)
    }
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout(){
        backgroundColor = .white
        contentView.backgroundColor = 0xE7E7E7.color
        contentView.layer.cornerRadius = 10
        
        [nameLabel, gradeImageView].forEach {
            contentView.addSubview($0)
        }
        
        gradeImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(24.adjusted)
            $0.width.equalTo(24.adjusted)
            $0.height.equalTo(30.adjusted)
        }
        nameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(gradeImageView.snp.trailing).offset(24.adjusted)
        }
    }
    
    // MARK: - General Helpers
    
    func dataBind(model: RankingModel) {
        nameLabel.text = model.name
        gradeImageView.image = UIImage(named: model.gradeImage)
    }
}
