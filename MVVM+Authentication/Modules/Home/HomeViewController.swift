//
//  HomeViewController.swift
//  MVVM+Authentication
//
//  Created by 김두리 on 2021/12/14.
//

import UIKit
import RxSwift

class HomeViewController: BaseViewController {
    private let homeView = HomeView()
    private let viewModel = HomeViewModel(
        userDefaults: UserDefaultsUtil()
    )
    
    static func instance() -> HomeViewController {
        return HomeViewController(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        self.view = self.homeView
    }
}
