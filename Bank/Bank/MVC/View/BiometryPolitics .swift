import Foundation
import LocalAuthentication
import UIKit

extension StartViewController {
    func start() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                     error: &error) {
            let reason = "Identify yourself"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                   localizedReason: reason,
                                   reply: { [weak self] success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self?.unlockSecretMessage()
                    } else {
                        let ac = UIAlertController(title: "Autentication failed",
                                                   message: "You can not be verified, please try again",
                                                   preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "OK",
                                                   style: .default))
                        self?.present(ac, animated: true)
                    }
                }
            })
        } else {
            let ac = UIAlertController(title: "Biometry unavailable",
                                       message: "Your device is not configured for biometric authentication",
                                       preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK",
                                       style: .default))
            present(ac, animated: true)
        }
    }
}
