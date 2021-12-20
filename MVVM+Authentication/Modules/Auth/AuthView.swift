//
//  AuthView.swift
//  MVVM+Authentication
//
//  Created by 김두리 on 2021/12/19.
//

import UIKit

class AuthView: BaseView {
    
    var emailField = UITextField()
    var passwordField = UITextField()
    
    var loginButton = UIButton()
    
    
    override func setup() {
        self.backgroundColor = .white
        
        self.emailField.placeholder = "이메일을 입력해주세요."
        self.emailField.keyboardType = .emailAddress
        
        self.passwordField.placeholder = "비밀번호를 입력하세요."
        self.passwordField.isSecureTextEntry = true
        
        self.loginButton.setTitle("로그인", for: .normal)
        self.loginButton.setTitleColor(.white, for: .normal)
        self.loginButton.backgroundColor = .black
        self.loginButton.layer.cornerRadius = 10
        
        [emailField, passwordField, loginButton].forEach {
            self.addSubview($0)
        }
        
    }
    
    override func bindConstraints() {
        // snp views
        
        emailField.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        passwordField.snp.makeConstraints {
            $0.leading.equalTo(emailField)
            $0.top.equalTo(emailField.snp.bottom).offset(15)
        }
        
        loginButton.snp.makeConstraints {
            $0.leading.equalTo(emailField)
            $0.trailing.equalTo(emailField)
            $0.top.equalTo(passwordField.snp.bottom).offset(30)
            $0.height.equalTo(50)
        }
    }
}
