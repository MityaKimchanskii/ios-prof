//
//  ViewController.swift
//  Bankey
//
//  Created by Mitya Kim on 8/7/22.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}

protocol LogoutDelegate: AnyObject {
    func didLogout()
}

class LoginViewController: UIViewController {
    
    // MARK: - Views
    let titleLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    // MARK: - Properties
    weak var delegate: LoginViewControllerDelegate?
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
    }
}

// MARK: - Extensions
extension LoginViewController {
    
    private func style() {
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        titleLabel.text = "Bankey"
        
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
    }
    
    private func layout() {
        
       
        view.addSubview(loginView)
        view.addSubview(titleLabel)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        NSLayoutConstraint.activate([
            // nameLabel
            loginView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            
            // LoginView
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
            
            // signInButton
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            
            // errorMessageLabel
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor)
        ])
    }
}

// MARK: - Actions
extension LoginViewController {
    @objc func signInButtonTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username / Password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / Password cannot be blank")
            return
        }
        
        if username == "Dima" && password == "777" {
            delegate?.didLogin()
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Incorrect Username / Password")
        }
        
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
        
    }
}

