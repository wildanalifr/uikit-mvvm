//
//  Untitled.swift
//  uikit-mvvm
//
//  Created by Wildan on 28/12/24.
//

import Foundation

protocol ViewModelProtocol: AnyObject {
    func onSetupView()
    func onLoginButtonTapped(username: String)
    var delegate: ViewModelDelegate? { get set }
}

protocol ViewModelDelegate: AnyObject {
    func setupView()
    func updateLoginButtonTapped(text: String)
}

class ViewModel: ViewModelProtocol {
    
    weak var delegate: ViewModelDelegate?
    
    func onSetupView() {
//        call function to view controller
        delegate?.setupView()
    }
    
    func onLoginButtonTapped(username: String) {
        if ((username.isEmpty) != nil) {
            if username == "admin" {
                delegate?.updateLoginButtonTapped(text: "Success Login")
            } else {
                delegate?.updateLoginButtonTapped(text: "Login Failed")
            }
        }
    }
    
    
}
