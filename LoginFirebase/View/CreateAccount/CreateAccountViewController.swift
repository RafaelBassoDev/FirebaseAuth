//
//  CreateAccountViewController.swift
//  LoginFirebase
//
//  Created by Rafael Basso on 21/09/23.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    private let usernameField = TextField(placeholder: "Username or email")
    private let passwordField = TextField(placeholder: "Password", isSecure: true)

    private let customFontAttributes: [NSAttributedString.Key: Any]? = {
       return [
        NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .medium)
       ]
    }()
    
    private lazy var createAccountButton: UIButton = {
        var config: UIButton.Configuration = .borderedProminent()
        config.title = "Create account"
        config.cornerStyle = .capsule
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(NSAttributedString(string: "Log in", attributes: customFontAttributes), for: .normal)
        return button
    }()

    private var usernameFieldTopAnchor: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Create Account"
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
        
        view.addSubview(createAccountButton)
        NSLayoutConstraint.activate([
            createAccountButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 15),
            createAccountButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            createAccountButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12),
            createAccountButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        createAccountButton.addTarget(self, action: #selector(didClickCreateAccountButton), for: .touchUpInside)
        
        usernameFieldTopAnchor = usernameField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50)
        usernameFieldTopAnchor.isActive = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        didClickUsernameField()
    }
}

extension CreateAccountViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view === self.view
    }
}

extension CreateAccountViewController {
    @objc
    private func didClickCreateAccountButton() {
        self.navigationController?.pushViewController(CreateAccountViewController(), animated: true)
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
