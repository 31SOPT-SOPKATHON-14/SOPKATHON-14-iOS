//
//  MyPageViewController.swift
//  SOPKATHON
//
//  Created by 장석우 on 2022/11/20.
//

import UIKit
import SnapKit

class MYPageViewController : UIViewController{
    
    //MARK: - Properties
  
    //MARK: - UI Components
    
    private let firstView = UIView()
    private let myView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let levelImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        return imageView
    }()
    
    private let myNameLabel : UILabel = {
        let label = UILabel()
        label.text = "장석우님"
        return label
    }()
    
    private let progressView : UIProgressView = {
        let progressView = UIProgressView()
        return progressView
    }()
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setUI()
        setLayout()
    }
    
    //MARK: - Custom Method
    
    private func setDelegate(){
        
    }
    
    private func setUI(){
        view.backgroundColor = .cyan
    }
    
    private func setLayout(){
        
    }
    
    //MARK: - Action Method
    
}
