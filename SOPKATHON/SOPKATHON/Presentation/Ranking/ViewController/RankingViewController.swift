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
    
    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .brown
        return view
    }() // headerView 갈색으로 표시
    
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
        RankingModel(gradeImage: "profileImage1", name: "배성호"),
        RankingModel(gradeImage: "profileImage1", name: "장석우"),
        RankingModel(gradeImage: "profileImage1", name: "강윤서"),
        RankingModel(gradeImage: "profileImage1", name: "최효원"),
        RankingModel(gradeImage: "profileImage1", name: "배성호"),
        RankingModel(gradeImage: "profileImage1", name: "장석우"),
        RankingModel(gradeImage: "profileImage1", name: "강윤서"),
        RankingModel(gradeImage: "profileImage1", name: "최효원"),
        RankingModel(gradeImage: "profileImage1", name: "배성호"),
        RankingModel(gradeImage: "profileImage1", name: "장석우"),
        RankingModel(gradeImage: "profileImage1", name: "강윤서"),
        RankingModel(gradeImage: "profileImage1", name: "최효원"),
    ]
 
    final let friendListInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 15.adjusted, bottom: 265.adjusted, right: 15.adjusted)
    final let friendListLineSpacing: CGFloat = 8.adjusted
    final let CellHeight: CGFloat = 48.adjusted
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        register()
    }
    
    private func setLayout(){
        
        view.backgroundColor = .white
        
        view.addSubview(rankingCollectionView)
        view.addSubview(headerView)
        
        
        headerView.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(361.adjusted)
            $0.height.equalTo(259.adjusted)
        }
        
        rankingCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(calculateCellHeight())
        }
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
        return CGSize(width: CellWidth, height: 48.adjusted)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return friendListLineSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return friendListInset
    }
    
    // MARK: collectionview에 header를 만들어주기 위해 사용
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width: CGFloat = collectionView.frame.width
        let height: CGFloat = 260.adjusted
        return CGSize(width: width, height: height)
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

