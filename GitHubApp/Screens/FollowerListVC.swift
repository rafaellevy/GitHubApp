//
//  FollowerListVC.swift
//  GitHubApp
//
//  Created by Rafael Levy on 7/20/21.
//

import UIKit

class FollowerListVC: UIViewController {
    
    /// section
    enum Section { case main }
    
    /// proprieties
    var username: String!
    var followers: [Followers] = []
    var page = 1
    
    /// Collection View and DataSource
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
        
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createMainLayout() )
        
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
    
    /// Flow Layout way
//    private func createThreeColumnLayout() -> UICollectionViewFlowLayout {
//        let width = view.bounds.width
//        let padding: CGFloat = 12
//        let minimumItemSpacing: CGFloat = 10
//        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
//        let itemSize = availableWidth / 3
//
//        let flowlayout = UICollectionViewFlowLayout()
//        flowlayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
//        flowlayout.itemSize = CGSize(width: itemSize, height: itemSize + 25)
//
//        return flowlayout
//
//    }
    
    /// code for when we have many sections
//    private func createCompositionalLayout() -> UICollectionViewLayout {
//        let layout = UICollectionViewCompositionalLayout {
//            sectionIndex, layoutEnvironment in
//            // what do to here?
//            let compSection = section.main[sectionIndex]
//            switch compSection.type {
//            default:
//                return self.createFeaturedSection(using: compSection)
//            }
//        }
//
//        let config = UICollectionViewCompositionalLayoutConfiguration()
//        config.interSectionSpacing = 20
//        layout.configuration = config
//        return layout
//    }
    
    private func createMainLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        ///  pading 
        //layoutItem.contentInsets = NSDirectionalEdgeInsets(top: <#T##CGFloat#>, leading: <#T##CGFloat#>, bottom: <#T##CGFloat#>, trailing: <#T##CGFloat#>)
        
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.4))
        
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        
        /// configuration scrolling /  of the section is done here
        
        //layoutSection.orthogonalScrollingBehavior = .none
        
        return UICollectionViewCompositionalLayout(section: layoutSection)
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
                }
                
            }
        }
    }

  


}


extension FollowerListVC: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let screenHeight = scrollView.frame.size.height
    
        
        if offsetY > contentHeight - screenHeight {
            page += 1
            getFollowersList(username: username, page: page)
        }
        
    }
}
