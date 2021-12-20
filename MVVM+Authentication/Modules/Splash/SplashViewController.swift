//
//  SplashViewController.swift
//  MVVM+Authentication
//
//  Created by 김두리 on 2021/12/14.
//

import UIKit
import RxSwift

class SplashViewConroller: BaseViewController {
    
    private let splashView = SplashView()
    private let viewModel = SplashViewModel(
        userDefaults: UserDefaultsUtil(),
        userService: UserSerivce()
    )
    
    static func instance() -> SplashViewConroller {
        return SplashViewConroller.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        super.view = self.splashView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func bindViewModel() {
        print("bindViewModel")
        self.viewModel.output.goToMain
            .asDriver(onErrorJustReturn: ())
            .drive(onNext: self.goToMain)
            .disposed(by: disposeBag)
        
        self.viewModel.output.goToSignIn
            .asDriver(onErrorJustReturn: ())
            .drive(onNext: self.goToSignIn).disposed(by: disposeBag)
    }
    
    private func goToMain() {
        print("goToMain")
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            sceneDelegate.goToMain()
        }
    }
    
    private func goToSignIn() {
        print("goToSignIn")
        if let scenceDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            scenceDelegate.goToSignIn()
        }
    }
    
}
