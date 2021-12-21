//
//  SplashViewModel.swift
//  MVVM+Authentication
//
//  Created by 김두리 on 2021/12/14.
//

import RxCocoa
import RxSwift

class SplashViewModel: BaseViewModel {
    let input = Input()
    let output = Output()
    let userDefaults: UserDefaultsUtil
    let userService: UserServiceProtocol
    
    struct Input {
        let viewDidLoad = PublishSubject<Void>()
        // RxViewController,
    }
    
    struct Output {
        let goToSignIn = PublishRelay<Void>()
        let goToMain = PublishRelay<Void>()
    }
    
    init(
        userDefaults: UserDefaultsUtil,
        userService: UserServiceProtocol
    ) {
        self.userDefaults = userDefaults
        self.userService = userService
        super.init()
        
        self.input.viewDidLoad
            .onNext(self.validateToken())
    }
    
    func validateToken() {
        let token = self.userDefaults.getUserToken()
        
        if self.validateTokenFromLocal(token: token) {
            self.validateTokenFromServer()
        } else {
            // 토큰 없을 떄
            self.output.goToSignIn.accept(())
        }
    }
    
    func validateTokenFromLocal(token: String) -> Bool {
        return !token.isEmpty
    }
    
    private func validateTokenFromServer() {
        // 토큰 있을 때 - 토큰 서버처리
        self.userService.fetchUserInfo()
            .do(onNext: { response in
                print(response)
            })
            .map {_ in Void()}
            .subscribe(
                onNext: self.output.goToMain.accept(_:))
            .disposed(by: disposeBag)
    }
    
}

