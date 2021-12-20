//
//  SignIn.swift
//  MVVM+Authentication
//
//  Created by 김두리 on 2021/12/14.
//

import Foundation

struct SignInRequest {
    let email: String
    let password: String
    
    var paramters: [String: Any] {
        return [
            "email": email,
            "password": password
        ]
    }
    
}

struct SignInResponse: Decodable {
    let accessToken: String
    let refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken
        case refreshToken
    }
}
