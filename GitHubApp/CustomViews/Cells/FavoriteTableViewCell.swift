//
//  FavoriteTableViewCell.swift
//  GitHubApp
//
//  Created by Rafael Levy on 9/2/21.
//


import UIKit

class FavoriteTableViewCell: UITableViewCell {
    static let reuseID = "FavoriteTableViewCell"
    //TODO: add avatar, usernamelabel
    
    let usernameLabel = GHTitleLabel(textAlignment: .right, fontSize: 15)
    let avatarImageView = GHAvatarImageView(frame: .zero)
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // TODO: set function using the follower object
    func set(favorite: Followers) {
        usernameLabel.text = favorite.login
        avatarImageView.downloadImage(from: favorite.avatarUrl)
    }
    
    // TODO: Configure function
    func configure() {
        contentView.addSubview(avatarImageView)
        contentView.addSubview(usernameLabel)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor,
            constant: padding)
        ])
    }
    
    

}