//
//  AuthViewController.swift
//  MVVM+Authentication
//
//  Created by 김두리 on 2021/12/14.
//

import UIKit

class AuthViewController: BaseViewController {
    private let authView = AuthView()
    private let viewModel = AuthViewModel(
        userDefaults: UserDefaultsUtil(),
        userService: UserSerivce()
    )
    
    static func instance() -> UINavigationController {
        let controller = AuthViewController(nibName: nil, bundle: nil)
        return UINavigationController(rootViewController: controller)
    }
    
    override func loadView() {
        super.view = self.authView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func bindViewModel() {
        
        self.viewModel.output.goToMain
            .asDriver(onErrorJustReturn: ())
            .drive(onNext: self.goToMain)
            .disposed(by: disposeBag)
    }
    
    private func goToMain() {
        print("goToMain")
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            sceneDelegate.goToMain()
        }
    }
    
}
