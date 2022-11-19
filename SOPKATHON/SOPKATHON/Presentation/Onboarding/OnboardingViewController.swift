//
//  OnboardingViewController.swift
//  SOPKATHON
//
//  Created by 장석우 on 2022/11/20.
//

import UIKit
import SnapKit
import Then


class OnboardingViewController : UIViewController{
    //MARK: - UI Components
    private lazy var logoImage = UIImageView().then {
        $0.image = UIImage(named: "logoImageFinal")
    }
   
    private lazy var inputUniTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 16, weight: .bold)
        textField.placeholder = "대학 입력하기"
        textField.textAlignment = .center
        textField.backgroundColor = UIColor(r: 217, g: 217, b: 217)
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 10
        
        return textField
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("캐미 시작하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(touchupHomeView), for: .touchUpInside)
        return button
    }()
    
    
    //MARK: - Screen Change
    private func pushToHomeView() {
        let homeView = HomeViewController()
        self.navigationController?.pushViewController(homeView, animated: true)
    }
    
    @objc
    private func touchupHomeView() {
        pushToHomeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
}

extension OnboardingViewController {
    private func setLayout() {
        view.backgroundColor = UIColor(r: 198, g: 183, b: 255).withAlphaComponent(100)
        
        [logoImage, inputUniTextField, startButton].forEach {
            view.addSubview($0)
        }
        
        logoImage.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(158)
            $0.centerX.equalTo(self.view.safeAreaLayoutGuide)
            $0.width.height.equalTo(223)
        }
        
        inputUniTextField.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(151)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(15)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-15)
            $0.height.equalTo(44)
        }
        
        startButton.snp.makeConstraints {
            $0.top.equalTo(inputUniTextField.snp.bottom).offset(8)
            $0.leading.trailing.equalTo(inputUniTextField)
            $0.height.equalTo(44)

        }
    }
}
