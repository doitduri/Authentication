//
//  BaseViewModel.swift
//  MVVM+Authentication
//
//  Created by 김두리 on 2021/12/14.
//

import RxSwift
import RxCocoa

class BaseViewModel {
    let disposeBag = DisposeBag()
    
    init() {
        self.bind()
    }
    
    func bind() {
        // input이랑 output 연결
    }
}
