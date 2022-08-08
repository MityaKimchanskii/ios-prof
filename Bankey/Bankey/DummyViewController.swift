//
//  DummyViewController.swift
//  Bankey
//
//  Created by Mitya Kim on 8/8/22.
//

import Foundation
import UIKit

class DummyViewController: UIViewController {
    
    // MARK: - Properties
    weak var logoutDelegate: LogoutDelegate?
    
    // MARK: - Views
    let stackView = UIStackView()
    let label = UILabel()
    let logoutButton = UIButton(type: .system)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

// MARK: - Extensions
extension DummyViewController {
    
    func style() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Dima IOS Developer"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.configuration = .filled()
        logoutButton.setTitle("Logout", for: [])
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .primaryActionTriggered)
    }
    
    func layout() {
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(logoutButton)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

// MARK: - Actions
extension DummyViewController {
    @objc func logoutButtonTapped(sender: UIButton) {
        logoutDelegate?.didLogout()
    }
}

