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
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "HelveticaNeue", size: 16)
        textField.tintColor = .white
        textField.layer.borderColor = UIColor.clear.cgColor
        return textField
    }()
    
    lazy var placeholder: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        label.textColor = .systemGray2
        label.text = "Username or email"
        return label
    }()
    
    init(type: InputFieldType) {
        super.init(frame: .zero)
        
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 12
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray2.cgColor
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
}
