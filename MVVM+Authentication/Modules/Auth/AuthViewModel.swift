//
//  AuthViewModel.swift
//  MVVM+Authentication
//
//  Created by 김두리 on 2021/12/19.
//

import RxSwift
import RxCocoa

class AuthViewModel: BaseViewModel {
    let input = Input()
    let output = Output()
    
    let userService: UserServiceProtocol
    let userDefaults: UserDefaultsUtil
    
    struct Input {
        let tapLoginButton = PublishSubject<Void>()
        let emailTextField = BehaviorRelay<String>(value: "")
        let passwordTextFiled = BehaviorRelay<String>(value: "")
    }
    
    struct Output {
        let goToMain = PublishRelay<Void>()
        // TODO 회원가입으로 가기 만들기
    }
    
    
    init(
        userDefaults: UserDefaultsUtil,
        userService: UserServiceProtocol
    ) {
        self.userService = userService
        self.userDefaults = userDefaults
        super.init()
        
        
    }
    
    override func bind() {
        self.input.emailTextField
            .subscribe(onNext: {
                print($0)
            })
            .disposed(by: disposeBag)
        
        self.input.passwordTextFiled
            .subscribe(onNext: {
                print($0)
            })
            .disposed(by: disposeBag)
        
        
        self.output.goToMain
            .asDriver(onErrorJustReturn: ())
            .drive(onNext: {
                self.signIn(request: SignInRequest(
                    email: self.input.emailTextField.value,
                    password: self.input.passwordTextFiled.value
                ))
            }).disposed(by: disposeBag)
    }
    
    private func signIn(request: SignInRequest) {
        print(request)
        self.userService.signIn(request: request)
            .subscribe { [weak self] response in
                guard let self = self else { return }
                UserDefaultsUtil.setUserToken(token: response.element?.accessToken)
                self.output.goToMain.accept(())
            }
            .disposed(by: disposeBag)
    }
}
