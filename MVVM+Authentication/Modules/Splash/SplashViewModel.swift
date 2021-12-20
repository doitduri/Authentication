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
    }
    
    override func bind() {
        print("viewModel- bind")
        self.input.viewDidLoad
            .subscribe(onNext: { [weak self] in
                self?.validateToken()
            })
            .disposed(by: disposeBag)
    }
    
    
    private func validateToken() {
        let token = self.userDefaults.getUserToken()
        
        if self.validateTokenFromLocal(token: token) {
            print("local")
            self.validateTokenFromServer()
        } else {
            self.output.goToSignIn.accept(())        }
    }
    
    private func validateTokenFromLocal(token: String) -> Bool {
        return !token.isEmpty
    }
    
    private func validateTokenFromServer() {
        print("validateTokenFromServer")
        
//        TODO 토큰
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

