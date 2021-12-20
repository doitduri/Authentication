//
//  SplashView.swift
//  MVVM+Authentication
//
//  Created by 김두리 on 2021/12/14.
//

import UIKit
import SnapKit

class SplashView: BaseView {
    
    let titleLabel = UILabel()
    
    override func setup() {
        self.backgroundColor = .white
        titleLabel.text = "SGS durikim"
        
        self.addSubview(titleLabel)
    }
    
    override func bindConstraints() {
        self.titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
