//
//  UIViewController+Ext.swift
//  GitHubApp
//
//  Created by Suha Baobaid on 8/3/21.
//

import UIKit

extension UIViewController {
    
    func presentGHAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = AlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    // TODO: create a function to put the empty state in the view
    
    func presentEmptyStateView(message: String) {
        DispatchQueue.main.async {
            let emptyStateView = EmptyStateView(message: message)
            emptyStateView.frame = self.view.bounds
            self.view.addSubview(emptyStateView)
        }

    }
}
