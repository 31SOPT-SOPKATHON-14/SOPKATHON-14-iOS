//
//  RankingViewController.swift
//  SOPKATHON
//
//  Created by 장석우 on 2022/11/20.
//

import UIKit

import SnapKit
import Then

class RankingViewController : UIViewController{
    
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
        label.text = "랭킹"
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
    
    private let schoolRankingLabel : UILabel = {
        let label = UILabel()
        label.text = "우리학교 랭킹"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    

    private lazy var rankingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    // MARK: - Variables
    
    var friendList: [RankingModel] = [
        RankingModel(gradeImage: "badge_a", name: "배성호"),
        RankingModel(gradeImage: "badge_a", name: "장석우"),
        RankingModel(gradeImage: "badge_b", name: "강윤서"),
        RankingModel(gradeImage: "badge_b", name: "최효원"),
        RankingModel(gradeImage: "badge_b", name: "배성호"),
        RankingModel(gradeImage: "badge_c", name: "장석우"),
        RankingModel(gradeImage: "badge_c", name: "강윤서"),
        RankingModel(gradeImage: "badge_f", name: "최효원"),
        RankingModel(gradeImage: "badge_f", name: "배성호"),
        RankingModel(gradeImage: "badge_f", name: "장석우"),
        RankingModel(gradeImage: "badge_a", name: "강윤서"),
        RankingModel(gradeImage: "badge_a", name: "최효원"),
    ]
 
    final let friendListInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 15.adjusted, bottom: 265.adjusted, right: 15.adjusted)
    final let friendListLineSpacing: CGFloat = 8.adjusted
    final let CellHeight: CGFloat = 56.adjusted
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        register()
    }
    
    private func setUI(){
        view.backgroundColor = .white
    }
    
    private func setLayout(){
        

        
        view.addSubViews(naviagationView,
                         myView,
                         schoolRankingLabel,
                         rankingCollectionView)
        
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
        
        schoolRankingLabel.snp.makeConstraints {
            $0.top.equalTo(myView.snp.bottom).offset(24)
            $0.leading.equalTo(myView)
        }
        
        
        rankingCollectionView.snp.makeConstraints {
            $0.top.equalTo(schoolRankingLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalTo(myView)
            $0.bottom.equalToSuperview()
        }
        
        
    }
    
    //MARK: - Action Method

    @objc func backButtonDidTapped(){
        navigationController?.popViewController(animated: true)
    }
}

extension RankingViewController{
    
    private func register() {
        rankingCollectionView.register(
            RankingCollectionViewCell.self,
            forCellWithReuseIdentifier: RankingCollectionViewCell.identifier
        )
    }
    
    // MARK: - General Helpers
    
    private func calculateCellHeight() -> CGFloat {
        let count = CGFloat(friendList.count)
        return count * CellHeight + (count - 1) * friendListLineSpacing + friendListInset.top + friendListInset.bottom
    }
}

// MARK: -UICollectionViewDelegate

extension RankingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let CellWidth = screenWidth - friendListInset.left - friendListInset.right
        return CGSize(width: CellWidth, height: 56)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return friendListLineSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return friendListInset
    }
}

// MARK: -UICollectionViewDataSource

extension RankingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RankingCollectionViewCell.identifier, for: indexPath)
                as? RankingCollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(model: friendList[indexPath.item])
        
        return cell
    }
}

