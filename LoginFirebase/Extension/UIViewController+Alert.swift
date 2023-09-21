//
//  UIViewController+Alert.swift
//  LoginFirebase
//
//  Created by Rafael Basso on 21/09/23.
//

import UIKit

extension UIViewController {
    enum AlertOption {
        case ok(label: String = "Ok", _ completionHandler: (() -> Void)? = nil)
        case cancel(label: String = "Cancel", _ completionHandler: (() -> Void)? = nil)
        case destructive(label: String = "Cancel", _ completionHandler: (() -> Void)? = nil)
        
        fileprivate func getAction() -> UIAlertAction {
            var title: String
            var style: UIAlertAction.Style
            var handler: () -> Void
            
            switch self {
            case .ok(let label, let completion):
                title = label
                style = .default
                handler = completion ?? {}
                
            case .cancel(let label, let completion):
                title = label
                style = .cancel
                handler = completion ?? {}
                
            case .destructive(let label, let completion):
                title = label
                style = .destructive
                handler = completion ?? {}
            }
            
            return UIAlertAction(title: title, style: style) { _ in handler() }
        }
    }
    
    func showAlert(
        title: String,
        message: String,
        options: [AlertOption]
    ) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            for option in options {
                let action = option.getAction()
                alertController.addAction(action)
            }
            
            self.navigationController?.present(alertController, animated: true)
        }
    }
}
