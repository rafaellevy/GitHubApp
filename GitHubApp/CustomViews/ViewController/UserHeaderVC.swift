//
//  UserHeaderVC.swift
//  GitHubApp
//
//  Created by Rafael Levy on 9/20/21.
//

import UIKit

class UserHeaderVC: UIViewController {
    
    var user: User!
    
    let usernameLabel = GHTitleLabel(textAlignment: .left, fontSize: 22)
    let avatarImageView = GHAvatarImageView(frame: .zero)
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
    
    
    



}
