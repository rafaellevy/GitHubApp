//
//  EmptySearchVC.swift
//  GitHubApp
//
//  Created by Rafael Levy on 8/5/21.
//

import UIKit

class EmptyStateView: UIView {
    
    /// Sub Views
    let imageView = UIImageView()
    let messageLabel = GHBodyLabel(textAlignment: .center, numberOfLines: 3)

    
    init(message: String) {
        super.init(frame: .zero)
        messageLabel.text = message
        configureImageView()
        configureMessage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureImageView() {
        addSubview(imageView)
        imageView.image = UIImage(named: "empty-state")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200)
            
        ])
    }

    func configureMessage() {
        addSubview(messageLabel)
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10 ),
            messageLabel.heightAnchor.constraint(equalToConstant: 55)
        ])


    }




}


  


