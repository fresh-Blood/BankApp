import UIKit
import LocalAuthentication


// MARK: create UITabBarController programmatically:
final class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupVCs()
    }
    
    private func setupVCs() {
        viewControllers = [
            createNavController(for: ViewController(), title: NSLocalizedString("Доходы", comment: ""), image: UIImage(systemName: "leaf.fill")!),
            createNavController(for: SecondViewController(), title: NSLocalizedString("Расходы", comment: ""), image: UIImage(systemName: "leaf")!),
            createNavController(for: ThirdViewController(), title: NSLocalizedString("Графики", comment: ""), image: UIImage(systemName: "eyes")!)
        ]
    }
    // MARK: create UINavigationController programmatically:
    private func createNavController(for rootViewController: UIViewController,
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
    
    internal func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}
