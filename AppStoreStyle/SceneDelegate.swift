//
//  SceneDelegate.swift
//  AppStoreStyle
//
//  Created by 정은경 on 2022/04/08.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .systemBackground
        window?.rootViewController = TabBarController()
        window?.makeKeyAndVisible()
    }

}

