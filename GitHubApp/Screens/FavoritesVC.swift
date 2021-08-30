//
//  FavoritesVC.swift
//  GitHubApp
//
//  Created by Rafael Levy on 7/7/21.
//

import UIKit

class FavoritesVC: UIViewController {
    
    let tableView = UITableView()
    var favorites: [Followers] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTableView()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.setNavigationBarHidden(false, animated: true)
        getFavorites()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.rowHeight = 80
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // TODO: Register your cell
    }
    
    func getFavorites() {
        PersistenceManager.retrieveFavorites { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                self.presentGHAlertOnMainThread(title: "Error!", message: error.rawValue, buttonTitle: "Ok")
            case .success(let favorites):
                if favorites.isEmpty {
                    self.presentEmptyStateView(message: "No favorites. Add your favorite users")
                } else {
                    self.favorites = favorites
                    // TODO: Reload the table
                    print(self.favorites)
                }
                
            }
        }
    }
    


}

extension FavoritesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return 1
    }
}
