//
//  FollowersCollectionViewCell.swift
//  GitHubApp
//
//  Created by Rafael Levy on 7/29/21.
//

import UIKit

class FollowersCollectionViewCell: UICollectionViewCell {
    static let reuseID = "FollowerCollectionViewCell"
    
    let usernameLabel = GHTitleLabel(textAlignment: .center, fontSize: 17 )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
//        addSubview(usernameLabel)
        contentView.addSubview(usernameLabel)
        NSLayoutConstraint.activate([
            usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func set(follower: Followers) {
        usernameLabel.text = follower.login
    }
    
}
