//
//  UserDefaultsUtil.swift
//  MVVM+Authentication
//
//  Created by 김두리 on 2021/12/14.
//

import Foundation

struct UserDefaultsUtil {
    static let KEY_TOKEN = "KEY_TOKEN"
    static let KEY_USER_ID = "KEY_USER_ID"
    static let KEY_EVENT = "KEY_EVENT"
    
    let instance: UserDefaults
    
    init(name: String? = nil) {
        if let name = name {
            UserDefaults().removePersistentDomain(forName: name)
            
            instance = UserDefaults(suiteName: name)!
        } else {
            instance = UserDefaults.standard
        }
    }
    
    func getUserToken() -> String {
        print("UserDefaultsUtil- getUserToken")
        return self.instance.string(forKey: UserDefaultsUtil.KEY_TOKEN) ?? ""
    }
    
    func setUserToken(token: String) {
        print("UserDefaultsUtil- setUserToken")
        self.instance.set(token, forKey: UserDefaultsUtil.KEY_TOKEN)
    }
    
    static func setUserToken(token: String?) {
        print("UserDefaultsUtil- setUserToken")
      UserDefaults.standard.set(token, forKey: UserDefaultsUtil.KEY_TOKEN)
    }
    
    static func getUserToken() -> String? {
        print("UserDefaultsUtil- getUserToken")
      return UserDefaults.standard.string(forKey: UserDefaultsUtil.KEY_TOKEN)
    }
    
    static func clear() {
        setUserToken(token: nil)
    }
}

