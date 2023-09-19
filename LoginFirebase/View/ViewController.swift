//
//  ViewController.swift
//  LoginFirebase
//
//  Created by Rafael Basso on 29/07/23.
//

import UIKit

class ViewController: UIViewController {

    private let usernameField = TextField()
    private let passwordField = TextField(isSecure: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(fatherViewClicked))
        gestureRecognizer.delegate = self
        view.addGestureRecognizer(gestureRecognizer)

        let usernameGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didClickUsernameField))
        usernameField.addGestureRecognizer(usernameGestureRecognizer)

        view.addSubview(usernameField)
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usernameField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            usernameField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12),
            usernameField.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        let passwordGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didClickPasswordField))
        passwordField.addGestureRecognizer(passwordGestureRecognizer)

        view.addSubview(passwordField)
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 15),
            passwordField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            passwordField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12),
            passwordField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc
    private func didClickUsernameField() {
        if (passwordField.isFirstResponder) {
            passwordField.didClickOffView()
        }
        usernameField.didClickOnView()
    }

    @objc
    private func didClickPasswordField() {
        if usernameField.isFirstResponder {
            usernameField.didClickOffView()
        }
        passwordField.didClickOnView()
    }
    
    @objc
    private func fatherViewClicked() {
        if (usernameField.isFirstResponder) { usernameField.didClickOffView() }
        if (passwordField.isFirstResponder) { passwordField.didClickOffView() }
    }

}

extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view === self.view
    }
}
