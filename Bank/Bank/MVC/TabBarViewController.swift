//
//  TabBarViewController.swift
//  Bank
//
//  Created by Admin on 20.10.2021.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupVCs()
    }
    
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: ViewController(), title: NSLocalizedString("Доходы", comment: ""), image: UIImage(systemName: "leaf.fill")!),
            createNavController(for: SecondViewController(), title: NSLocalizedString("Расходы", comment: ""), image: UIImage(systemName: "leaf")!),
            createNavController(for: ThirdViewController(), title: NSLocalizedString("Графики", comment: ""), image: UIImage(systemName: "eyes")!)
        ]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        tabBar.barStyle = .black
        tabBar.tintColor = .white
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = nil
        return navController
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}
