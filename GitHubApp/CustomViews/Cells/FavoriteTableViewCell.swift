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
    static let reuseID = "FavoriteTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    func set(favorite: Followers) {
        usernameLabel.text = favorite.login
        avatarImageView.downloadImage(from: favorite.avatarUrl)
    }
    
    func configure() {
        contentView.addSubview(avatarImageView)
        contentView.addSubview(usernameLabel)
        accessoryType = .disclosureIndicator
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor,
            constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            avatarImageView.widthAnchor.constraint(equalTo:avatarImageView.heightAnchor),
            usernameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    

}
