//
//  HomeViewController.swift
//  SOPKATHON
//
//  Created by 장석우 on 2022/11/20.
//

import UIKit
import SnapKit

class HomeViewController : UIViewController{
    
    //MARK: - View Style
    enum ViewType {
        case missionStart
        case missionFinish
        
        var arrivalText: String {
            switch self {
            case .missionFinish:
                return "달성 완료!"
            case .missionStart:
                return "미션이 도착했어요!"
            }
        }
        
        var clickText: String {
            switch self {
            case .missionStart:
                return "클릭해서 확인해보세요!"
            case .missionFinish:
                return "마이페이지에서 달성한 미션들을 확인하세요."
            }
        }
    }
    
    var viewType: ViewType = .missionFinish {
        didSet {
            setSuccessView()
        }
    }
    

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
    
    private let dateBackgroundView: UIView = {
        let view = UIView()
         view.clipsToBounds = true
        view.backgroundColor = UIColor(r: 191, g: 191, b: 255).withAlphaComponent(100)
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
//        label.text = "미션이 도착했어요!"
        label.font = .systemFont(ofSize: 32, weight: .bold)

        return label
    }()
    
    private let missionClickLabel: UILabel = {
        let label = UILabel()
//        label.text = "클릭해서 미션을 확인해보세요!"
        label.font = .systemFont(ofSize: 16, weight: .medium)

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
    
    private func pushToMyPageView() {
        let mypageView = MyPageViewController()
        self.navigationController?.pushViewController(mypageView, animated: true)
    }
    
    @objc
    private func touchupMyPageButton() {
        let nextVC = MyPageViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    private func pushToRankingView() {
        let rankingView = RankingViewController()
        self.navigationController?.pushViewController(rankingView, animated: true)
    }
    
    @objc
    private func touchupRakingButton() {
        pushToRankingView()
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
        rankingButton.setImage(UIImage(named: "ic_ranking"), for: .normal)
        myPageButton.setImage(UIImage(named: "ic_my"), for: .normal)
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

extension HomeViewController {
    private func setSuccessView() {
        switch viewType {
        case .missionStart:
            dateBackgroundView.isHidden = false
            dateLabel.isHidden = false
            missionArriveLabel.text = viewType.arrivalText
            missionClickLabel.text = viewType.clickText
            missionClickButton.setImage(UIImage(named: "mission"),for: .normal)
        case .missionFinish:
            dateBackgroundView.isHidden = true
            missionArriveLabel.text = viewType.arrivalText
            missionClickLabel.text = viewType.clickText
            missionClickButton.setImage(UIImage(named: "successMission"),for: .normal)
        }
    }
}

