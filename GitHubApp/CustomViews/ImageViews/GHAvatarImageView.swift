//
//  GHAvatarImageView.swift
//  GitHubApp
//
//  Created by Suha Baobaid on 8/3/21.
//

import UIKit

class GHAvatarImageView: UIImageView {
    
    let placeholderImage = UIImage(named: "avatar-placeholder")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadAndSetImage(from url: String) {
        NetworkManager.shared.downloadImage(from: url) { [weak self ] uiImage in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.image = uiImage

            }
        }
    }
    
    
    
}
