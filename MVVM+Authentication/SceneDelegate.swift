//
//  SceneDelegate.swift
//  MVVM+Authentication
//
//  Created by 김두리 on 2021/12/14.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScence = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScence.coordinateSpace.bounds)
        window?.windowScene = windowScence
        window?.rootViewController = SplashViewConroller.instance()
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {    }

    func sceneDidBecomeActive(_ scene: UIScene) {    }

    func sceneWillResignActive(_ scene: UIScene) {    }

    func sceneWillEnterForeground(_ scene: UIScene) {    }

    func sceneDidEnterBackground(_ scene: UIScene) {    }
    
    func goToMain() {
        window?.rootViewController = HomeViewController.instance()
        window?.makeKeyAndVisible()
    }
    
    func goToSignIn() {
        window?.rootViewController = AuthViewController.instance()
        window?.makeKeyAndVisible()
    }
}

