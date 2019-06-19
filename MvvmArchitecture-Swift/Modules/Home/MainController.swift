//
//  ViewController.swift
//  MvvmArchitecture-Swift
//
//  Created by James on 2019/6/19.
//  Copyright © 2019 geekdroid. All rights reserved.
//

import UIKit
import SnapKit
import RxCocoa

class MainController: ViewController<MainViewModel> {


    lazy var testLabel: UILabel = {
       let view = UILabel()
        view.text = "This is a test."
        view.textColor = .red
        view.textAlignment = .center
        view.font = UIFont.boldSystemFont(ofSize: 18)
        return view
    }()
    
    lazy var loginBtn: UIButton = {
       let view = UIButton()
        view.setTitle("Login", for: .normal)
        view.setTitleColor(.red, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 4
        //view.layer.backgroundColor = UIColor.yellow.cgColor
        return view
    }()
    
    override func initialize() {
        view.addSubview(testLabel)
        testLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        view.addSubview(loginBtn)
        loginBtn.snp.makeConstraints { (make) in
            make.top.equalTo(testLabel.snp.bottom).offset(20)
            make.width.equalToSuperview().offset(-30)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
        }
    }
    
    override func initBindings() {
        let output = viewModel.transform(input: MainViewModel.Input(loginTap: loginBtn.rx.tap))
        output.isLoading
            .flatMapLatest{ isLoading in
                isLoading ? Driver.just(.green) : Driver.just(.black)
            }
        .drive(testLabel.rx.backgroundColor)
            .disposed(by: rx.disposeBag)
    }

}

