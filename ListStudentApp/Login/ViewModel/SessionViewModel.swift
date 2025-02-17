//
//  SessionViewModel.swift
//  ListStudentApp
//
//  Created by Hans Arthur Cupiterson on 17/02/25.
//

import UIKit

protocol SessionViewModelDelegate: AnyObject {
    func updateErrorMessage(_ error: String)
}

protocol SessionViewModelProtocol {
    func validateLoginCredential(
        username: String,
        password: String,
        delegate: SessionViewModelDelegate
    ) -> Bool
}

class SessionViewModel: SessionViewModelProtocol {
    func validateLoginCredential(
        username: String,
        password: String,
        delegate: any SessionViewModelDelegate
    ) -> Bool{
        guard !username.isEmpty else {
            delegate.updateErrorMessage("Username is required!")
            return false
        }
        
        guard !password.isEmpty else {
            delegate.updateErrorMessage("Password is required!")
            return false
        }
        
        guard username == "alfagift-admin" && password == "asdf" else {
            delegate.updateErrorMessage("User Credential does not match!")
            return false
        }
        
        delegate.updateErrorMessage("")
        return true
    }
}
