//
//  Signup.swift
//  MVVM+Authentication
//
//  Created by 김두리 on 2021/12/18.
//

import Foundation

struct SignupRequest {
    let email: String
    let password: String
    
    var paramters: [String: Any] {
        return [
            "email": email,
            "password": password
        ]
    }
}

struct SignupResponse {
    
}
