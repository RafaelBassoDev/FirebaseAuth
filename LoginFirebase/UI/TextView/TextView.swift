//
//  TextInputField.swift
//  LoginFirebase
//
//  Created by Rafael Basso on 04/08/23.
//

import UIKit

enum InputFieldType {
    case username, password
}

class TextView: UIView {
    
    private let HORIZONTAL_MARGIN: CGFloat = 15
    private let FONT_NAME: String = "HelveticaNeue"
    private let TEXTFIELD_FONT_SIZE: CGFloat = 16
    private let PLACEHOLDER_FONT_SIZE: CGFloat = 16
    private let PLACEHOLDER_FONT_SIZE_MINIMIZED: CGFloat = 13
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: FONT_NAME, size: TEXTFIELD_FONT_SIZE)
        textField.tintColor = .white
        textField.layer.borderColor = UIColor.clear.cgColor
        return textField
    }()
    
    lazy var placeholder: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: FONT_NAME, size: PLACEHOLDER_FONT_SIZE)
        label.textColor = .systemGray2
        label.text = "Username or email"
        return label
    }()
    
    private var placeholderBottomAnchor: NSLayoutConstraint!
    private var placeholderHeightAnchor: NSLayoutConstraint!
    
    init(type: InputFieldType) {
        super.init(frame: .zero)
        
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 12
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray2.cgColor
        
        directionalLayoutMargins.leading = HORIZONTAL_MARGIN
        directionalLayoutMargins.trailing = HORIZONTAL_MARGIN
        
        setupPlaceholderView()
        
        setupViewFor(type)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension TextView {
    private func setupViewFor(_ inputFieldType: InputFieldType) {
        switch inputFieldType {
        case .username:
            textField.autocapitalizationType = .none
            textField.autocorrectionType = .no
        case .password:
            textField.autocapitalizationType = .none
            textField.autocorrectionType = .no
            textField.isSecureTextEntry = true
        }
    }
    
    private func setupPlaceholderView() {
        addSubview(placeholder)
        NSLayoutConstraint.activate([
            placeholder.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: -2),
            placeholder.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            placeholder.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor)
        ])
        
        placeholderBottomAnchor = placeholder.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)
        placeholderBottomAnchor.isActive = true
        
        placeholderHeightAnchor = placeholder.heightAnchor.constraint(equalToConstant: 25)
        placeholderHeightAnchor.isActive = false
    }
}
