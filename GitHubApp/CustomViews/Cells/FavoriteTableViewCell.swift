//
//  FavoriteTableViewCell.swift
//  GitHubApp
//
//  Created by Rafael Levy on 9/2/21.
//


import UIKit

class FavoriteTableViewCell: UITableViewCell {

    let usernameLabel = GHTitleLabel(textAlignment: .right, fontSize: 16)
    let avatarImageView = GHAvatarImageView(frame: .zero)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "FavoriteTableViewCell")
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

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
