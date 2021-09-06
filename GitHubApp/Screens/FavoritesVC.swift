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
        
        tableView.register(FavoriteTableViewCell.self, forCellReuseIdentifier: FavoriteTableViewCell.reuseID)
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
                    print(self.favorites)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        // bring tableview on top of empty state
                        self.view.bringSubviewToFront(self.tableView)
                    }
                }
                
            }
        }
    }
    


}

extension FavoritesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteTableViewCell.reuseID, for: indexPath) as! FavoriteTableViewCell
        let content = favorites[indexPath.row]
        cell.set(favorite: content)
        return cell
    }
    
    // TODO: Add delete functionality to the tableview
    // TODO: use the persistence manager to delete that favorite
    // TODO: Update the UI with the new favorites
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
                favorites.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            // UserDefaults * should I call save and pass the array ?
            PersistenceManager.updateWith(favorite: favorites[indexPath.row], actionType: .remove) {
                error in
        
            }
            
            }
        tableView.reloadData()
    }
}
