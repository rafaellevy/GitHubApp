//
//  UserVC.swift
//  GitHubApp
//
//  Created by Rafael Levy on 9/22/21.
//

import UIKit

class UserVC: UIViewController {
    
    let headerView: UIView = UIView()
    
//    var user: User!
    
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
        getUserInfo(username: username)
        configureViewController()
        configureLayout()
    }
    
    private func configureViewController() {
        view.backgroundColor = .systemBackground
    }
    
    func getUserInfo(username: String) {
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                self.presentGHAlertOnMainThread(title: "!", message: error.rawValue, buttonTitle: "OK")
            case .success(let user):
                DispatchQueue.main.async {
                    self.configureUIElements(with: user)
                }
            }
        }
    }
    
    private func configureUIElements(with user: User) {
        // Add the userHeaderVC to the view
        let userHeaderVC = UserHeaderVC(user: user)
        addChild(userHeaderVC)
        userHeaderVC.view.frame = headerView.bounds
        headerView.addSubview(userHeaderVC.view)
        userHeaderVC.didMove(toParent: self)
    }
    
    private func configureLayout() {
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            headerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}
