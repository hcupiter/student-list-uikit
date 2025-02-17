//
//  LoginView.swift
//  ListStudentApp
//
//  Created by Hans Arthur Cupiterson on 17/02/25.
//

import UIKit

class LoginView: UIView {
    private lazy var titleLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login"
        label.font = .systemFont(ofSize: 36, weight: .bold)
        return label
    }()
    
    private lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Username"
        textField.backgroundColor = .secondarySystemFill
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 6
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.backgroundColor = .secondarySystemFill
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 6
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        return textField
    }()

    private lazy var userInputContainer: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 8
        view.alignment = .center
        return view
    }()
    
    private lazy var errorMessage: UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.font = .systemFont(ofSize: 12)
        lbl.textColor = .red
        return lbl
    }()
    
    private lazy var loginBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 6
        return button
    }()
    
    private lazy var promptContainer: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 16
        view.alignment = .center
        return view
    }()
    
    private lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var vc: LoginViewControllerProtocol?
    
    init(vc: LoginViewControllerProtocol) {
        super.init(frame: .zero)
        self.vc = vc
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// Method for updating view
extension LoginView {
    func updateErrorMessage(_ error: String) {
        errorMessage.text = error
    }
    
    @objc private func loginButtonTapped() {
        vc?.validateData(
            username: usernameTextField.text ?? "",
            password: passwordTextField.text ?? ""
        )
    }
}

// Method to setup view
private extension LoginView {
    func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        userInputContainer.addArrangedSubview(usernameTextField)
        userInputContainer.addArrangedSubview(passwordTextField)
        userInputContainer.addArrangedSubview(errorMessage)
        
        promptContainer.addArrangedSubview(titleLbl)
        promptContainer.addArrangedSubview(userInputContainer)
        
        container.addSubview(promptContainer)
        container.addSubview(loginBtn)
        
        self.addSubview(container)
        setupConstraint()
        
        // Add target-action for the login button
        loginBtn.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            usernameTextField.leadingAnchor.constraint(equalTo: userInputContainer.leadingAnchor),
            usernameTextField.trailingAnchor.constraint(equalTo: userInputContainer.trailingAnchor),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.leadingAnchor.constraint(equalTo: userInputContainer.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: userInputContainer.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            errorMessage.leadingAnchor.constraint(equalTo: userInputContainer.leadingAnchor),
            errorMessage.trailingAnchor.constraint(equalTo: userInputContainer.trailingAnchor),
            
            titleLbl.leadingAnchor.constraint(equalTo: promptContainer.leadingAnchor),
            titleLbl.trailingAnchor.constraint(equalTo: promptContainer.trailingAnchor),
            userInputContainer.leadingAnchor.constraint(equalTo: promptContainer.leadingAnchor),
            userInputContainer.trailingAnchor.constraint(equalTo: promptContainer.trailingAnchor),
            
            promptContainer.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            promptContainer.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            promptContainer.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: -80),
            
            loginBtn.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            loginBtn.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            loginBtn.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            loginBtn.heightAnchor.constraint(equalToConstant: 60),
            
            container.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            container.topAnchor.constraint(equalTo: self.topAnchor),
            container.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
