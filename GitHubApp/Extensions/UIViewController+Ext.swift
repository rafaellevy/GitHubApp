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
    
    
    func presentEmptyStateView(message: String) {
        DispatchQueue.main.async {
            let emptyStateView = EmptyStateView(message: message)
            emptyStateView.frame = self.view.bounds
            self.view.addSubview(emptyStateView)
        }

    }
    
    func showLoadingView() {
        var spinner = UIActivityIndicatorView(style: .medium)
        
        let containerView = UIView(frame: view.bounds)
        
        view.addSubview(containerView)
        containerView.addSubview(spinner)
        
        containerView.backgroundColor = .systemBackground
        
        containerView.alpha = 0
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        UIView.animate(withDuration: 0.25) {
            containerView.alpha = 0.8
        }
        
        spinner.startAnimating()
        
    }
    
    func dismissLoadingView() {
                
        // todo: hack global
        
    }

    
}
