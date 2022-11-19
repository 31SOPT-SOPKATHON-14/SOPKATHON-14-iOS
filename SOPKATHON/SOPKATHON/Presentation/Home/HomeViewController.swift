//
//  HomeViewController.swift
//  SOPKATHON
//
//  Created by 장석우 on 2022/11/20.
//

import UIKit
import SnapKit

class HomeViewController : UIViewController{
    

    //MARK: - UI Components
    private let myPageButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private let rankingButton: UIButton = {
       let button = UIButton()
        return button
    }()
    
    private let dateBackgroundView: UIView = {
        let view = UIView()
         view.clipsToBounds = true
        view.backgroundColor = .blue
         view.layer.cornerRadius = 12
         return view
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let missionArriveLabel: UILabel = {
        let label = UILabel()
        label.text = "미션이 도착했어요!"
        return label
    }()
    
    private let missionClickLabel: UILabel = {
        let label = UILabel()
        label.text = "클릭해서 미션을 확인해보세요!"
        return label
    }()
    
    private lazy var missionClickButton: UIButton = {
        let button = UIButton()
        button.imageView?.contentMode = .scaleToFill
        button.addTarget(self, action: #selector(touchupMissionButton), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Screen Change
    private func pushToMissionView() {
        let missionView = MissionViewController()
        self.navigationController?.pushViewController(missionView, animated: true)
    }
    
    @objc
    private func touchupMissionButton() {
        pushToMissionView()
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        getCurrentDateTime()
        configButton()
        
    }
    
    //MARK: - Custom Method
    private func getCurrentDateTime(){
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        formatter.dateFormat = "MM월 dd일"
        let str = formatter.string(from: Date())
        dateLabel.text = "\(str)"
    }
    
    private func configButton() {
        rankingButton.setImage(UIImage(systemName: "bolt"), for: .normal)
        myPageButton.setImage(UIImage(systemName: "heart"), for: .normal)
        missionClickButton.setImage(UIImage(named: "mission"),for: .normal)
    }
    
    private func setLayout(){
        view.backgroundColor = .white
        [myPageButton, rankingButton, dateBackgroundView,missionArriveLabel, missionClickLabel, missionClickButton].forEach {
            view.addSubview($0)
        }
        
        dateBackgroundView.addSubview(dateLabel)
        
        rankingButton.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(20)
            $0.width.height.equalTo(32)
        }
        
        myPageButton.snp.makeConstraints {
            $0.top.equalTo(rankingButton.snp.top)
            $0.trailing.equalTo(rankingButton.snp.leading).offset(-20)
            $0.width.height.equalTo(32)
        }
        
        dateBackgroundView.snp.makeConstraints {
            $0.top.equalTo(myPageButton.snp.bottom).offset(76)
            $0.centerX.equalTo(self.view.safeAreaLayoutGuide)
            $0.width.equalTo(99)
            $0.height.equalTo(43)
        }
        
        dateLabel.snp.makeConstraints {
            $0.centerX.equalTo(dateBackgroundView)
            $0.centerY.equalTo(dateBackgroundView)
        }
        
        missionArriveLabel.snp.makeConstraints {
            $0.top.equalTo(dateBackgroundView.snp.bottom).offset(16)
            $0.centerX.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        missionClickLabel.snp.makeConstraints {
            $0.top.equalTo(missionArriveLabel.snp.bottom).offset(12)
            $0.centerX.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        missionClickButton.snp.makeConstraints {
            $0.top.equalTo(missionClickLabel.snp.bottom).offset(32)
            $0.centerX.equalTo(self.view.safeAreaLayoutGuide)
            $0.width.height.equalTo(320)
        }
    }
    
}


