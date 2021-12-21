//
//  HomeView.swift
//  MVVM+Authentication
//
//  Created by 김두리 on 2021/12/20.
//

import UIKit


class HomeView: BaseView {
    
    let titleLabel = UILabel()
    
    override func setup() {
        self.backgroundColor = .white
        titleLabel.text = "Home View"
        
        self.addSubview(titleLabel)
    }
    
    override func bindConstraints() {
        self.titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
