//
//  HomeViewModel.swift
//  MVVM+Authentication
//
//  Created by 김두리 on 2021/12/21.
//

import RxSwift
import RxCocoa

class HomeViewModel: BaseViewModel {
    let input = Input()
    let output = Output()
    let userDefaults: UserDefaultsUtil
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    init(
        userDefaults: UserDefaultsUtil
    ) {
        self.userDefaults = userDefaults
        super.init()
    }
    
}
