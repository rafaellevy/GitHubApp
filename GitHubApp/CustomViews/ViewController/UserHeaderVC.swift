//
//  UserHeaderVC.swift
//  GitHubApp
//
//  Created by Rafael Levy on 9/20/21.
//

import UIKit

class UserHeaderVC: UIViewController {
    
    var user: User!
    
    let containerView = UIView()
    
    var usernameLabel = GHTitleLabel(textAlignment: .left, fontSize: 22)
    var avatarImageView = GHAvatarImageView(frame: .zero)
    let nameLabel = GHSecondaryTitleLabel(textAlignment: .left, fontSize: 17)
    let locationLabel = GHSecondaryTitleLabel(textAlignment: .left, fontSize: 17)
    let locationIcon = UIImageView()
    let bioLabel = GHBodyLabel(textAlignment: .center, numberOfLines: 0)
    
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
        
    }
    
    // TODO: configure fuction should assign propetries
    // TODO: layout UI function : consider all the constraints
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func configureContainerView() {
        view.addSubview(containerView)
//        containerView.backgroundColor = .systemBackground
//        containerView.layer.cornerRadius = 10
//        containerView.layer.borderColor = UIColor.white.cgColor
//        containerView.layer.borderWidth = 2
//        containerView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            containerView.widthAnchor.constraint(equalToConstant: 280),
//            containerView.heightAnchor.constraint(equalToConstant: 200),
//        ])
    }
    
    func configureUsernameLabel() {
        containerView.addSubview(usernameLabel)
        usernameLabel.text = user.login
        //        NSLayoutConstraint.activate([
        //            usernameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
        //            usernameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
        //            usernameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
        //            usernameLabel.heightAnchor.constraint(equalToConstant: 28)
        //
        //        ])

    }
    
    func configureAvatarImageView() {
        containerView.addSubview(avatarImageView)
        NetworkManager.shared.downloadImage(from: user.avatarUrl) { image in
            self.avatarImageView.image = image
        }
//        NSLayoutConstraint.activate([
//            avatarImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
//            avatarImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
//            avatarImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
//            avatarImageView.heightAnchor.constraint(equalToConstant: 28)
//
//        ])
    }
    
    func configureNameLabel() {
        containerView.addSubview(nameLabel)
        nameLabel.text = user.name
//        NSLayoutConstraint.activate([
//            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
//            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
//            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
//            nameLabel.heightAnchor.constraint(equalToConstant: 28)
//
//        ])
   
    }
    
    func configureLocationLabel() {
        containerView.addSubview(locationLabel)
        locationLabel.text = user.location
//        NSLayoutConstraint.activate([
//            locationLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
//            locationLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
//            locationLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
//            locationLabel.heightAnchor.constraint(equalToConstant: 28)
//
//        ])
   
    }
    
    func configureLocationIcon() {
        containerView.addSubview(locationIcon)
//        locationIcon.image = UIView
//        addButton.setImage(UIImage(systemName: "heart"), for: .normal)
//        NSLayoutConstraint.activate([
//            locationIcon.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
//            locationIcon.leadingAnchor.constraint(equalTo: locationIcon.leadingAnchor, constant: 10),
//            avatarImageView.trailingAnchor.constraint(equalTo: locationIcon.trailingAnchor, constant: -10),
//            locationIcon.heightAnchor.constraint(equalToConstant: 28)
//
//        ])
    }
    
    func configureBioLabel() {
        view.addSubview(bioLabel)
//        NSLayoutConstraint.activate([
//            bioLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
//            bioLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
//            bioLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
//            bioLabel.heightAnchor.constraint(equalToConstant: 28)
//
//        ])
   
    }
    



}
