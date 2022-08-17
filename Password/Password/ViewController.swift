//
//  ViewController.swift
//  Password
//
//  Created by Mitya Kim on 8/15/22.
//

import UIKit

class ViewController: UIViewController {
    
    let stackView = UIStackView()
    let newPasswordTextField = PasswordTextField(placeHolderText: "New password")
    let statusView = PasswordStatusView()
    let confirmPasswordTextField = PasswordTextField(placeHolderText: "Re-enter new password")
    let resetButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }

}

extension ViewController {
    func style() {
        // StackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        // Password textField
        newPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
//        criteriaView.translatesAutoresizingMaskIntoConstraints = false
        statusView.translatesAutoresizingMaskIntoConstraints = false
        
        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.configuration = .filled()
        resetButton.setTitle("Reset password", for: [])
        resetButton.addTarget(self, action: #selector(resetPasswordButtonTapped), for: .primaryActionTriggered)
    }
    
    func layout() {
        stackView.addArrangedSubview(newPasswordTextField)
        stackView.addArrangedSubview(statusView)
        stackView.addArrangedSubview(confirmPasswordTextField)
        stackView.addArrangedSubview(resetButton)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2)
        ])
    }
    
    @objc private func resetPasswordButtonTapped() {
        
    }
}
