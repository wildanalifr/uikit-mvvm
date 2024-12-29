//
//  ViewController.swift
//  uikit-mvvm
//
//  Created by Wildan on 28/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemBackground
        textField.font = .systemFont(ofSize: 14)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
   
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var isLoginText: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = .white
//        textLabel.text = "check"
        textLabel.font = .systemFont(ofSize: 20)
        textLabel.textAlignment = .center
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    private let viewModel: ViewModel
    
    init(viewModel: ViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        viewModel.onSetupView()
    }
    
   
    
    @objc
    private func loginButtonTapped() {
        print("Login button tapped")
        
        viewModel.onLoginButtonTapped(username: usernameTextField.text ?? "")
        
       
        
//        let alert = UIAlertController(title: "OK", message: "Gass", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        present(alert, animated: true, completion: nil)
    }


}

extension ViewController: ViewModelDelegate {
    func setupView() {
        view.addSubview(usernameTextField)
        view.addSubview(loginButton)
        view.addSubview(isLoginText)
        
        usernameTextField.becomeFirstResponder()
        
        NSLayoutConstraint.activate([
            
            usernameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            usernameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            usernameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            loginButton.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            isLoginText.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            isLoginText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            isLoginText.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        usernameTextField.becomeFirstResponder()
//        usernameTextField.delegate = self
    }
    
    func updateLoginButtonTapped(text: String) {
        isLoginText.text = text
    }
    
    
}
