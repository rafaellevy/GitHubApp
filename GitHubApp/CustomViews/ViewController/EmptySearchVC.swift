//
//  EmptySearchVC.swift
//  GitHubApp
//
//  Created by Rafael Levy on 8/5/21.
//

import UIKit

class EmptySearchVC: UIViewController {

    /// Container view
    let containerView = UIView()
    
    /// Sub Views
    let imageView = UIImageView()
    let alertTitleLabel = GHTitleLabel(textAlignment: .center, fontSize: 34)
    let messageLabel = GHBodyLabel(textAlignment: .center, numberOfLines: 6)

    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray

//        configureContainerView()
//        configureAlertTitle()
//        configureGHButton()
//        configureMessage()
    }


    func configureContainerView() {
        view.addSubview(containerView)
//        containerView.backgroundColor =  transparency?
//        containerView.layer.cornerRadius = 10
//        containerView.layer.borderColor = UIColor.white.cgColor
//        containerView.layer.borderWidth = 2
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: view.topAnchor)
                    ])


    }
    
    func configureImageView() {
        containerView.addSubview(imageView)
        // imageView.translatesAutoresizingMaskIntoConstraints = false ???? do I need that ?
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: containerView.trailingAnchor),
            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
//            imageView.topAnchor.constraint(equalTo: containerView, constant: 20)
        ])
    }

    func configureAlertTitle() {
        containerView.addSubview(alertTitleLabel)
//        NSLayoutConstraint.activate([
//            alertTitleLabel.topAnchor.constraint(equalTo: containerView.centerYAnchor),
//            alertTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
//            alertTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
//            alertTitleLabel.heightAnchor.constraint(equalToConstant: 28)
//
//        ])
    }
//
//
//    func configureMessage() {
//        containerView.addSubview(messageLabel)
//        NSLayoutConstraint.activate([
//            messageLabel.topAnchor.constraint(equalTo: alertTitleLabel.bottomAnchor, constant: 4),
//            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
//            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10 ),
//            messageLabel.bottomAnchor.constraint(equalTo: ghButton.topAnchor, constant: -10)
//        ])
//
//
//    }
//
//
//

//
//    @objc func dismissAlertVC( ) {
//        dismiss(animated: true)
//
//    }

}


  


