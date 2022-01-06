import UIKit



class StartViewController: UIViewController {
    
    private let neo: UIImageView = {
       let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.alpha = 0.5
        return img
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(neo)
        neo.image = UIImage(named: "Neo")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        start()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        neo.frame = view.bounds
    }
    
    func unlockSecretMessage() {
        let vc = TabBarViewController()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc,
                animated: true,
                completion: nil)
    }
}
