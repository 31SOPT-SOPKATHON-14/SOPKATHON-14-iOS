//
//  MyPageViewController.swift
//  SOPKATHON
//
//  Created by 장석우 on 2022/11/20.
//

import UIKit
import SnapKit

class MyPageViewController : UIViewController{
    
    //MARK: - Properties
    
    var missionData = [
        "대학교 고양이 밥주기",
        "좋아하는 사람과 중앙 호수 걷기",
        "좋아하는 선배와 학식 먹기",
        "잔디밭에서 술마시기",
        "혜화 대학로 호호식당 방문하기",
        "대학교 고양이 밥주기",
        "좋아하는 사람과 중앙 호수 걷기",
        "좋아하는 선배와 학식 먹기",
        "잔디밭에서 술마시기",
        "혜화 대학로 호호식당 방문하기",
        "대학교 고양이 밥주기",
        "좋아하는 사람과 중앙 호수 걷기",
        "좋아하는 선배와 학식 먹기",
        "잔디밭에서 술마시기",
        "혜화 대학로 호호식당 방문하기"
    ]
  
    //MARK: - UI Components
    
    private let naviagationView : UIView = {
        let view = UIView()
        return view
    }()
    
    private let backButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.contentMode = .scaleAspectFill
        button.tintColor = .black
        button.addTarget(self, action: #selector(backButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    private let navigationLabel : UILabel = {
        let label = UILabel()
        label.text = "마이페이지"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    private let myView : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 4
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        return view
    }()
    
    private let levelImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "badgeA")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let myNameLabel : UILabel = {
        let label = UILabel()
        label.text = "장석우님"
        label.font = .systemFont(ofSize: 24, weight: .medium)
        return label
    }()
    
    private let progressView : UIProgressView = {
        let progressView = UIProgressView()
        progressView.tintColor = .camiLightPurple
        progressView.trackTintColor = .systemGray4
        progressView.progress = 0.5
        return progressView
    }()
    
    private let successMissionDescriptionLabel : UILabel = {
        let label = UILabel()
        label.text = "총 달성 갯수"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    private let successMissionLabel : UILabel = {
        let label = UILabel()
        label.text = "4/5"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .camiLightPurple
        return label
    }()
    
    private let lastMissionLabel : UILabel = {
        let label = UILabel()
        label.text = "지난 미션들"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let missionTableView : UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.sectionHeaderTopPadding = 5
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRegister()
        setDelegate()
        setUI()
        setLayout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        progressView.layer.cornerRadius = 4
    }
    
    //MARK: - Custom Method
    
    private func setRegister(){
        missionTableView.register(MissionTableViewCell.self, forCellReuseIdentifier: "1")
    }
    
    private func setDelegate(){
        missionTableView.delegate = self
        missionTableView.dataSource = self
    }
    
    private func setUI(){
        view.backgroundColor = .white
    }
    
    private func setLayout(){
        
        view.addSubViews(naviagationView,myView,lastMissionLabel,missionTableView)
        naviagationView.addSubViews(backButton,navigationLabel)
        
        myView.addSubViews(
            levelImageView,
            myNameLabel,
            progressView,
            successMissionDescriptionLabel,
            successMissionLabel
        )
        
        backButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
            $0.height.width.equalTo(20)
        }
        
        navigationLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(backButton.snp.trailing).offset(10)
        }
        
        naviagationView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        myView.snp.makeConstraints {
            $0.top.equalTo(naviagationView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(14)
            $0.height.equalTo(130)
        }

        levelImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.height.equalTo(74)
            $0.width.equalTo(60)
        }
        
        myNameLabel.snp.makeConstraints {
            $0.top.equalTo(levelImageView).offset(5)
            $0.leading.equalTo(levelImageView.snp.trailing).offset(16)
        }
        
        progressView.snp.makeConstraints {
            $0.top.equalTo(myNameLabel.snp.bottom).offset(6)
            $0.leading.equalTo(myNameLabel)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(8)
        }
        
        successMissionDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(progressView.snp.bottom).offset(8)
            $0.leading.equalTo(progressView)
        }
        
        successMissionLabel.snp.makeConstraints {
            $0.centerY.equalTo(successMissionDescriptionLabel)
            $0.trailing.equalTo(progressView)
        }
        
        lastMissionLabel.snp.makeConstraints {
            $0.top.equalTo(myView.snp.bottom).offset(24)
            $0.leading.equalTo(myView)
        }
        
        missionTableView.snp.makeConstraints {
            $0.top.equalTo(lastMissionLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalTo(myView)
            $0.bottom.equalToSuperview()
        }
        
    }
    
    //MARK: - Action Method
    
    @objc func backButtonDidTapped(){
        navigationController?.popViewController(animated: true)
    }
    
}

extension MyPageViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missionData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "1", for: indexPath) as! MissionTableViewCell
        cell.missionLabel.text = missionData[indexPath.row]
        return cell
    }
    
    
}
