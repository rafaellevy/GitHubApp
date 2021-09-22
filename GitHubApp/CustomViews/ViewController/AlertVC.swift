//
//  AlertVC.swift
//  GitHubApp
//
//  Created by Rafael Levy on 7/20/21.
//

import UIKit

class AlertVC: UIViewController {
    
    
    let containerView = UIView()
    let alertTitleLabel = GHTitleLabel(textAlignment: .center, fontSize: 24)
    let messageLabel = GHBodyLabel(textAlignment: .center, numberOfLines: 3)
    let ghButton = GHButton(title: "Dismiss", backgroundColor: .systemGreen)
    
    
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitleLabel.text = title
        self.messageLabel.text = message
        self.ghButton.setTitle(buttonTitle, for: .normal)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configureContainerView()
        configureAlertTitle()
        configureGHButton()
        configureMessage()
    }
    
    
    func configureContainerView() {
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 10
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.layer.borderWidth = 2
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    func configureAlertTitle() {
        containerView.addSubview(alertTitleLabel)
        NSLayoutConstraint.activate([
            alertTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            alertTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            alertTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            alertTitleLabel.heightAnchor.constraint(equalToConstant: 28)
            
        ])
    }
    
    
    func configureMessage() {
        containerView.addSubview(messageLabel)
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: alertTitleLabel.bottomAnchor, constant: 4),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10 ),
            messageLabel.bottomAnchor.constraint(equalTo: ghButton.topAnchor, constant: -10)
        ])
        
        
    }
    

    
    func configureGHButton() {
        containerView.addSubview(ghButton)
        ghButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ghButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            ghButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            ghButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            ghButton.heightAnchor.constraint(equalToConstant: 42)
            
            
        ])
        ghButton.addTarget(self, action: #selector(dismissAlertVC), for: .touchUpInside)
        
    }
    
    @objc func dismissAlertVC( ) {
        dismiss(animated: true)

    }
    
}
