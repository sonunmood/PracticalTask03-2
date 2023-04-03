//
//  SceneDelegate.swift
//  PracticalTask03-2
//
//  Created by Sonun on 2/4/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let homeVC = MainViewController()
        let homeTabBatItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        homeVC.tabBarItem = homeTabBatItem
        
        let navigationController = UINavigationController(rootViewController: homeVC)
        
        
        let favoriteVC = FavoriteViewController()
        let favoriteTabBatItem = UITabBarItem(title: "Favorite", image: UIImage(systemName: "suit.heart.fill"), tag: 0)
        favoriteVC.tabBarItem = favoriteTabBatItem
        
        let cartVC = CartViewController()
        let cartTAbBatItem = UITabBarItem(title: "Carts", image: UIImage(systemName: "note.text"), tag: 0)
        cartVC.tabBarItem = cartTAbBatItem
        
        let orderVC = OrderViewController()
        let orderTAbBatItem = UITabBarItem(title: "My orders", image: UIImage(systemName: "cloud"), tag: 0)
        orderVC.tabBarItem = orderTAbBatItem
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [navigationController,favoriteVC,cartVC,orderVC]
        tabBarController.tabBar.backgroundColor = .white
        
        window.rootViewController = tabBarController
        
        self.window = window
        self.window?.makeKeyAndVisible()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

