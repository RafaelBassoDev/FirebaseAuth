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

    private lazy var logInButton: UIButton = {
        var config: UIButton.Configuration = .filled()
        config.background.backgroundColor = .systemBlue
        config.baseForegroundColor = .white
        config.title = "Log in"
        config.cornerStyle = .capsule
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var usernameFieldTopAnchor: NSLayoutConstraint!

    
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
        
        view.addSubview(logInButton)
        NSLayoutConstraint.activate([
            logInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 15),
            logInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            logInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12),
            logInButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        usernameFieldTopAnchor = usernameField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50)
        usernameFieldTopAnchor.isActive = true

        logInButton.addTarget(self, action: #selector(didClickLogInButton), for: .touchUpInside)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        didClickUsernameField()
    }
    
    @objc
    private func didClickLogInButton() {
        
    }
    
    @objc
    private func didClickUsernameField() {
        if (passwordField.isFirstResponder) {
            passwordField.didClickOffView()
        }
        usernameField.didClickOnView()
        usernameFieldTopAnchor.constant = -100
    }

    @objc
    private func didClickPasswordField() {
        if usernameField.isFirstResponder {
            usernameField.didClickOffView()
        }
        passwordField.didClickOnView()
        usernameFieldTopAnchor.constant = -100
    }
    
    @objc
    private func fatherViewClicked() {
        if (usernameField.isFirstResponder) { usernameField.didClickOffView() }
        if (passwordField.isFirstResponder) { passwordField.didClickOffView() }
        usernameFieldTopAnchor.constant = -50
    }

}

extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view === self.view
    }
}

extension ViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
}
