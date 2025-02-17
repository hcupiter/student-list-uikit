//
//  LoginViewController.swift
//  ListStudentApp
//
//  Created by Hans Arthur Cupiterson on 17/02/25.
//

import UIKit

protocol LoginViewControllerProtocol {
    func validateData(username: String, password: String)
}

class LoginViewController: UIViewController {
    private lazy var loginView = LoginView(vc: self)
    var session: SessionViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
    }

}

extension LoginViewController: SessionViewModelDelegate {
    func updateErrorMessage(_ error: String) {
        loginView.updateErrorMessage(error)
    }
    
}

extension LoginViewController: LoginViewControllerProtocol {
    func validateData(username: String, password: String) {
        guard let session = session else {
            fatalError("Session View Model is not initialized!")
        }
        
        let result = session.validateLoginCredential(
            username: username,
            password: password,
            delegate: self
        )
        
        debugPrint(result)
    }
}

private extension LoginViewController {
    func setup() {
        self.view.backgroundColor = .white
        self.session = .init()
        self.view.addSubview(loginView)
        
        setConstraint()
    }
    
    func setConstraint() {
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            loginView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            loginView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            loginView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
