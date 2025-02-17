//
//  LoginViewController.swift
//  ListStudentApp
//
//  Created by Hans Arthur Cupiterson on 17/02/25.
//

import UIKit

protocol LoginViewControllerProtocol: AnyObject {
    func validateData(username: String, password: String)
}

class LoginViewController: UIViewController {
    private lazy var loginView = LoginView(vc: self)
    private var session: SessionViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        loginView.resetView()
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
        
        if result {
            self.navigationController?.pushViewController(
                StudentListViewController(),
                animated: true
            )
        }
    }
}

private extension LoginViewController {
    func setup() {
        self.view.backgroundColor = .white
        self.view.addSubview(loginView)
        self.session = .init()
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
