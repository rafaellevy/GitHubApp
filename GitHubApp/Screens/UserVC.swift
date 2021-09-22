//
//  UserVC.swift
//  GitHubApp
//
//  Created by Rafael Levy on 9/22/21.
//

import UIKit

class UserVC: UIViewController {
    
    let headerView: UIView = UIView()
    
    var username: String!
    
    init(username: String) {
        super.init(nibName: nil, bundle: nil)
        self.username = username
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    private func configureViewController() {
        view.backgroundColor = .systemBackground
    }
    
    // TODO: Create a function to request userInfo, result is User

}
