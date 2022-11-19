//
//  LaterHomeViewController.swift
//  SOPKATHON
//
//  Created by 최효원 on 2022/11/20.
//

import UIKit

class LaterHomeViewController: UIViewController {
    
    //MARK: - UI Components
    private let myPageButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(touchupMyPageButton), for: .touchUpInside)
        return button
    }()
    
    private let rankingButton: UIButton = {
       let button = UIButton()
        button.addTarget(self, action: #selector(touchupRakingButton), for: .touchUpInside)
        return button
    }()
    
    private let missionArriveLabel: UILabel = {
        let label = UILabel()
        label.text = "달성 완료!"
        label.font = .systemFont(ofSize: 32, weight: .bold)

        return label
    }()
    
    private let missionClickLabel: UILabel = {
        let label = UILabel()
        label.text = "마이페이지에서 달성한 미션들을 확인하세요."
        label.font = .systemFont(ofSize: 16, weight: .medium)

        return label
    }()
    
    private lazy var missionClickButton: UIButton = {
        let button = UIButton()
        button.imageView?.contentMode = .scaleToFill
        button.isSelected = false
        button.adjustsImageWhenHighlighted = false
        return button
    }()
    
    private func pushToMyPageView() {
        let mypageView = MyPageViewController()
        self.navigationController?.pushViewController(mypageView, animated: true)
    }
    
    @objc
    private func touchupMyPageButton() {
        pushToMyPageView()
    }
    
    private func pushToRankingView() {
        let rankingView = RankingViewController()
        self.navigationController?.pushViewController(rankingView, animated: true)
    }
    
    @objc
    private func touchupRakingButton() {
        pushToRankingView()
    }
    
    private func configButton() {
        missionClickButton.setImage(UIImage(named: "successMission"),for: .normal)
        rankingButton.setImage(UIImage(named: "ic_ranking"), for: .normal)
        myPageButton.setImage(UIImage(named: "ic_my"), for: .normal)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        configButton()

    }
    
    private func setLayout(){
        view.backgroundColor = .white
        [myPageButton, rankingButton, missionArriveLabel, missionClickLabel, missionClickButton].forEach {
            view.addSubview($0)
        }
        
        
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
        
        missionArriveLabel.snp.makeConstraints {
            $0.top.equalTo(myPageButton.snp.bottom).offset(102)
            $0.centerX.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        missionClickLabel.snp.makeConstraints {
            $0.top.equalTo(missionArriveLabel.snp.bottom).offset(12)
            $0.centerX.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        missionClickButton.snp.makeConstraints {
            $0.top.equalTo(missionClickLabel.snp.bottom).offset(66)
            $0.centerX.equalTo(self.view.safeAreaLayoutGuide)
            $0.width.height.equalTo(320)
        }
    }
    

    
}
