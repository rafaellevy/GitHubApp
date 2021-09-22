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
    
    
    
    func configureAvatarImageView() {
        view.addSubview(avatarImageView)
        avatarImageView.downloadAndSetImage(from: user.avatarUrl)
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            avatarImageView.heightAnchor.constraint(equalToConstant: 80),
            avatarImageView.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func configureUsernameLabel() {
        view.addSubview(usernameLabel)
        usernameLabel.text = user.login
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            usernameLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
        
    }
    
    
    func configureNameLabel() {
        view.addSubview(nameLabel)
        nameLabel.text = user.name
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
            
        ])
        
    }
    
    func configureLocationIcon() {
        containerView.addSubview(locationIcon)
        locationIcon.image = UIImage(systemName: "mappin.and.ellipse")
        NSLayoutConstraint.activate([
            locationIcon.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            locationIcon.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            locationIcon.heightAnchor.constraint(equalToConstant: 20),
            locationIcon.widthAnchor.constraint(equalToConstant: 20)

        ])
    }
    
    func configureLocationLabel() {
        view.addSubview(locationLabel)
        locationLabel.text = user.location
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            locationLabel.leadingAnchor.constraint(equalTo: locationIcon.trailingAnchor, constant: 5),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            locationLabel.heightAnchor.constraint(equalToConstant: 20)

        ])
    }
    

    
    func configureBioLabel() {
        view.addSubview(bioLabel)
        bioLabel.text = user.bio
        NSLayoutConstraint.activate([
            bioLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 20),
            bioLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
   
    }
    



}
