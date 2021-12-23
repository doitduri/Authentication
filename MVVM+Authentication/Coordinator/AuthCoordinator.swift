//
//  Scene.swift
//  MVVM+Authentication
//
//  Created by 김두리 on 2021/12/23.
//

import UIKit

class AuthCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    weak var parentCoordinator: MainCoordinator?
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = AuthViewController.instance()
        // vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    // TODO 비밀번호 찾기 등등 할 때 페이지 선언
    
}
