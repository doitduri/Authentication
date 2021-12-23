//
//  AuthViewController.swift
//  MVVM+Authentication
//
//  Created by 김두리 on 2021/12/14.
//

import UIKit
import RxSwift
import RxCocoa

class AuthViewController: BaseViewController {
    private let authView = AuthView()
    private let viewModel = AuthViewModel(
        userDefaults: UserDefaultsUtil(),
        userService: UserSerivce()
    )
    
    weak var coordinator: MainCoordinator?
    
    static func instance() -> AuthViewController {
        return AuthViewController(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        super.view = self.authView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func bindViewModel() {
        
        self.authView.loginButton.rx.tap
            .bind(to: self.viewModel.input.tapLoginButton)
            .disposed(by: disposeBag)
        
        //        self.viewModel.output.goToMain
        //            .asDriver(onErrorJustReturn: ())
        //            .drive(onNext: self.goToMain)
        //            .disposed(by: disposeBag)
    }
    
    private func goToMain() {
        print("goToMain")
        //        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
        //            sceneDelegate.goToMain()
        //        }
    }
    
}
