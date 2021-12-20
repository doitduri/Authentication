//
//  UserInfo.swift
//  MVVM+Authentication
//
//  Created by 김두리 on 2021/12/14.
//

import Foundation

struct UserInfoResponse: Decodable {
    let id: Int
    let email: String
    let isAdmin: Bool
    let password: String
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case isAdmin
        case password
    }
    
    
}
