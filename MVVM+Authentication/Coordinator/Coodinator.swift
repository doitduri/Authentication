//
//  SceneCoodinator.swift
//  MVVM+Authentication
//
//  Created by 김두리 on 2021/12/23.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
