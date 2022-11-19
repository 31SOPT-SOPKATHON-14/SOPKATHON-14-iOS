//
//  MissionViewController.swift
//  SOPKATHON
//
//  Created by 장석우 on 2022/11/20.
//

import UIKit

import SnapKit
import Then

class MissionViewController : UIViewController{
    
    
    
    //MARK: - Properties
    
    //MARK: - UI Components
    private let naviView = UIView()
    private lazy var backButton = UIButton()
    private let naviLabel = UILabel()
    
    private let missionImageView = UIImageView()
    
    private let presentImageView = UIImageView()
    private let missionTitleLabel = UILabel()
    
    private let missionViewOne = UIView()
    private let missionViewTwo = UIView()
    private let missionViewThree = UIView()
    
    private let missionOne = UILabel()
    private let missionTwo = UILabel()
    private let missionThree = UILabel()
    
    private let missionImageOne = UIImageView()
    private let missionImageTwo = UIImageView()
    private let missionImageThree = UIImageView()
    
    private let descriptionLabel = UILabel()
    
    private let finishMissionButton = UIButton()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setAddTarget()
        view.backgroundColor = .white
      
    }
    
    
    //MARK: - Action Method
    
}

extension MissionViewController {
    private func setAddTarget() {
        backButton.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
    }
    
    
    private func setUI() {
        
        backButton.do {
            $0.setBackgroundImage(Image.backButton, for: .normal)
        }
        
        
        naviLabel.do {
            $0.text = "오늘의 미션"
            $0.font = .systemFont(ofSize: 20, weight: .bold)
        }
        
        missionImageView.do {
            $0.backgroundColor = .gray
            $0.layer.cornerRadius = 12
            $0.image = Image.missionImage
            $0.isUserInteractionEnabled = true
        }
        
        presentImageView.do {
            $0.image = Image.present
            $0.layer.shadowColor = UIColor.black.cgColor
            $0.layer.shadowOpacity = 0.15
            $0.layer.shadowOffset = CGSize(width: 0, height: 4)
        }
        
        missionTitleLabel.do {
            $0.text = "좋아하는 사람과 중앙호수 걷기"
            $0.font = .systemFont(ofSize: 18, weight: .bold)
        }
        
        [missionViewOne, missionViewTwo, missionViewThree].forEach {
            $0.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1.0)
            $0.layer.cornerRadius = 12
        }
        
        missionImageOne.image = Image.heart
        missionImageTwo.image = Image.smile
        missionImageThree.image = Image.nature
        
        [missionOne, missionTwo, missionThree].forEach {
            $0.font = .systemFont(ofSize: 16, weight: .regular)
        }
        
        missionOne.do {
            $0.text = "좋아하는 사람에게 연락한다."
            $0.font = .systemFont(ofSize: 16, weight: .regular)
        }
        missionTwo.do {
            $0.text = "중앙 광장에서 모인다."
            $0.font = .systemFont(ofSize: 16, weight: .regular)
        }
        
        missionThree.do {
            $0.text = "함께 산책하며 즐거운 시간을 보낸다."
            $0.font = .systemFont(ofSize: 16, weight: .regular)
        }
        
        finishMissionButton.do {
            $0.setTitle("달성완료", for: .normal)
            $0.backgroundColor = .main
            $0.layer.cornerRadius = 10
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            $0.setTitleColor(.black, for: .normal)
        }
    }
    
    private func setLayout() {
        naviView.addSubViews(backButton, naviLabel)
        missionViewOne.addSubViews(missionOne, missionImageOne)
        missionViewTwo.addSubViews(missionTwo, missionImageTwo)
        missionViewThree.addSubViews(missionThree, missionImageThree)
        view.addSubViews(naviView, missionImageView, missionTitleLabel, presentImageView, missionViewOne, missionViewTwo, missionViewThree,  finishMissionButton)

        backButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.height.equalTo(20.adjusted)
        }
        
        naviLabel.snp.makeConstraints {
            $0.leading.equalTo(backButton.snp.trailing)
            $0.centerY.equalToSuperview()
        }
        
        naviView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(12.adjusted)
            $0.leading.trailing.equalToSuperview().inset(15.adjusted)
            $0.height.equalTo(32.adjusted)
        }
        
        missionImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(naviView.snp.bottom).offset(11.adjusted)
        }

        presentImageView.snp.makeConstraints {
            $0.top.equalTo(missionImageView.snp.bottom).offset(24.adjusted)
            $0.leading.equalToSuperview().inset(24.adjusted)
            $0.size.equalTo(28.adjusted)
        }

        missionTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(presentImageView.snp.trailing).offset(12.adjusted)
            $0.centerY.equalTo(presentImageView.snp.centerY)
        }

        missionViewOne.snp.makeConstraints {
            $0.top.equalTo(presentImageView.snp.bottom).offset(24.adjusted)
            $0.directionalHorizontalEdges.equalToSuperview().inset(15.adjusted)
            $0.height.equalTo(64)
        }

        missionViewTwo.snp.makeConstraints {
            $0.top.equalTo(missionViewOne.snp.bottom).offset(16.adjusted)
            $0.directionalHorizontalEdges.equalToSuperview().inset(15.adjusted)
            $0.height.equalTo(64)
        }

        missionViewThree.snp.makeConstraints {
            $0.top.equalTo(missionViewTwo.snp.bottom).offset(16.adjusted)
            $0.directionalHorizontalEdges.equalToSuperview().inset(15.adjusted)
            $0.height.equalTo(64)
        }

        missionImageOne.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(12.adjusted)
            $0.centerY.equalToSuperview()
        }

        missionImageTwo.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(12.adjusted)
            $0.centerY.equalToSuperview()
        }

        missionImageThree.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(12.adjusted)
            $0.centerY.equalToSuperview()
        }

        missionOne.snp.makeConstraints {
            $0.leading.equalTo(missionImageOne.snp.trailing).offset(12.adjusted)
            $0.centerY.equalToSuperview()
        }

        missionTwo.snp.makeConstraints {
            $0.leading.equalTo(missionImageTwo.snp.trailing).offset(12.adjusted)
            $0.centerY.equalToSuperview()
        }

        missionThree.snp.makeConstraints {
            $0.leading.equalTo(missionImageThree.snp.trailing).offset(12.adjusted)
            $0.centerY.equalToSuperview()
        }

        finishMissionButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(44.adjusted)
            $0.directionalHorizontalEdges.equalToSuperview().inset(15.adjusted)
        }
    }
    
    @objc
    private func popViewController() {
        print(">?")
        self.navigationController?.popViewController(animated: true)
    }
}
