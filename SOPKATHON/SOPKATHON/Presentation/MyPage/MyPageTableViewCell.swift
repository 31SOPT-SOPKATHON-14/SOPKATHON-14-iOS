//
//  MissionTableViewCell.swift
//  SOPKATHON
//
//  Created by 장석우 on 2022/11/20.
//
//

import UIKit
import SnapKit

class MissionTableViewCell : UITableViewCell{
    
    //MARK: - UI Components
   
    let missionImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "present")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let missionLabel : UILabel = {
        let label = UILabel()
        label.text = "건국대 호수에서 문보트를 타보세용"
        return label
    }()
    
    //MARK: - Life Cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 7, left: 0, bottom: 7, right: 0))
        contentView.layer.cornerRadius = 10
    }
    
    //MARK: - Custom Method
    
    private func setUI(){
        selectionStyle = .none
        contentView.backgroundColor = .camiGray
    }
    
    private func setLayout(){
        contentView.addSubViews(missionImageView,missionLabel)
        
        missionImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
        
        missionLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(missionImageView.snp.trailing).offset(12)
        }
    
    }
    
    
    
}
