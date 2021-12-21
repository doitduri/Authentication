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

    self.viewModel.input.viewDidLoad.onNext(())

    /* RxViewController
     self.rx.viewDidLoad
     .subscribe(onNext: {
     print("viewDidLoad 🎉")
     })
     */

  }

  override func bindViewModel() {
    /*
    self.rx.viewDidLoad
    .subscribe(onNext: {
    print("viewDidLoad 🎉")
    }) */
    
    self.viewModel.input.viewDidLoad
      .subscribe { _ in
        self.viewModel.validateToken()
      }
      .disposed(by: disposeBag)

    self.viewModel.output.goToSignIn
      .debug()
      .subscribe(onNext: { _ in
        self.goToSignIn()
      }).disposed(by: disposeBag)

    self.viewModel.output.goToMain
      .asDriver(onErrorJustReturn: ())
      .drive(onNext: self.goToMain)
      .disposed(by: self.disposeBag)
  }

    
    // MARK: 네비게이터로 분리 하기
  func goToMain() {
    if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
      sceneDelegate.goToMain()
    }
  }

  func goToSignIn() {
    if let scenceDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
      scenceDelegate.goToSignIn()
    }
  }

}
