//
//  SearchVC.swift
//  GitHubApp
//
//  Created by Rafael Levy on 7/7/21.
//

import UIKit

class SearchVC: UIViewController {
    
    let userNameTextField = GHTextField()
    let gitHubLogoImageView = UIImageView()
    let ghButton = GHButton(title: "Search", backgroundColor: .systemGreen)
    
    var isUsernameEmpty: Bool {
        if userNameTextField.text == "" {
            return true
        } else {
            return false
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureImageView()
        configureTextField()
        configureGHButton()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)

    }
    
    func configureImageView() {
        view.addSubview(gitHubLogoImageView)
        gitHubLogoImageView.image = UIImage(named: "logo")
        gitHubLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gitHubLogoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            gitHubLogoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gitHubLogoImageView.heightAnchor.constraint(equalToConstant: 200),
            gitHubLogoImageView.widthAnchor.constraint(equalToConstant: 200),
            
        ])
    }
    

    func configureTextField() {
        view.addSubview(userNameTextField)
        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: gitHubLogoImageView.bottomAnchor, constant: 40),
            userNameTextField.heightAnchor.constraint(equalToConstant: 56),
            userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
        ])
        
    }
    
    func configureGHButton() {
        view.addSubview(ghButton)
        NSLayoutConstraint.activate([
            ghButton.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 20),
            ghButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ghButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            ghButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        ghButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
    }
    
    @objc func pushFollowerListVC() {
        guard !isUsernameEmpty else {
            presentGHAlertOnMainThread(title: "!", message: "Please enter a valid username", buttonTitle: "Dismiss")
            return
           
        }
        NetworkManager.shared.getUserInfo(for: userNameTextField.text!) { [weak self] userResult in
            switch userResult {
            case .failure(let error):
                print(error.rawValue)
            case .success(let user):
                let favorite = Followers(login: user.login, avatarUrl: user.avatarUrl)
                PersistenceManager.checkExistence(of: favorite) { [weak self] isFavoritedResult in
                    guard let self = self else { return }
                    DispatchQueue.main.async {
                        let followerListVC = FollowerListVC(username: self.userNameTextField.text!, isFavorited: isFavoritedResult)
                        self.navigationController?.pushViewController(followerListVC, animated: true)
                    }
                   
                }
            }
        }
    }
    
    
    
    
    
    
    

    

}
