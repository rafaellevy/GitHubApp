//
//  FollowerListVC.swift
//  GitHubApp
//
//  Created by Rafael Levy on 7/20/21.
//

import UIKit

class FollowerListVC: UIViewController {
    
    enum Section { case main }
    var username: String!
    var followers: [Followers] = []
    var page = 1
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Followers>!
    
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
        configureCollectionView()
        configureDataSource()
        getFollowersList(username: username, page: page)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func configureViewController() {
        view.backgroundColor = .systemBackground
        title = username
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnLayout() )
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.register(FollowersCollectionViewCell.self, forCellWithReuseIdentifier: FollowersCollectionViewCell.reuseID)
        view.addSubview(collectionView)
        
        
    }
    
    
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section,Followers>(collectionView: collectionView, cellProvider: { collection, indexPath, follower in
            let cell = collection.dequeueReusableCell(withReuseIdentifier: FollowersCollectionViewCell.reuseID, for: indexPath) as! FollowersCollectionViewCell
            cell.set(follower: follower)
            return cell
        })
    }
    
    private func updateData(followers: [Followers]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Followers>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
    }
    
    private func createThreeColumnLayout() -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemSize = availableWidth / 3
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowlayout.itemSize = CGSize(width: itemSize, height: itemSize)
        
        return flowlayout
        
    }
    
    func getFollowersList(username: String, page: Int) {
        NetworkManager.shared.getFollowers(username: username, page: page) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            case .failure(let error):
                self.presentGHAlertOnMainThread(title: "Error", message: error.rawValue, buttonTitle: "Ok")
            case .success(let followers):
                self.followers.append(contentsOf: followers)
                
                if self.followers.isEmpty {
                    self.presentEmptyStateView(message: "This user has no followers! Go follow them")
                }
                DispatchQueue.main.async {
                    self.updateData(followers: self.followers)
                    // TODO: create a function to take the list of followers and present them (snapshot)
                }
                
            }
        }
    }

  


}


extension FollowerListVC: UICollectionViewDelegate {
}
