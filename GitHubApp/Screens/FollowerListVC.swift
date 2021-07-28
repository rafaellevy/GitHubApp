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
        
       //TO DO: Flow layout 
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnLayout() )
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
        NetworkManager.shared.getFollowers(username: username, page: page) { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let followers):
                print(followers)
            }
        }
    }
    

}
