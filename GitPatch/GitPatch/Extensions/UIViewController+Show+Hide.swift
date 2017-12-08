//
//  UIViewController+Show+Hide.swift
//  GitPatch
//
//  Created by Rolland Cédric on 04.12.17.
//  Copyright © 2017 Rolland Cédric. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // MARK: - Errors
    func showError(withMessage message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Loading
    func showLoadingView() {
        // need to substract status bar and nav bar height in order to have the loading wheel at the center.
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        let navBarHeight = self.navigationController?.navigationBar.frame.size.height
        let loadingView = UIView(frame: CGRect(origin: view.frame.origin, size: CGSize(width: view.frame.width, height: view.frame.height - statusBarHeight - (navBarHeight ?? 0))))
        loadingView.tag = 42
        loadingView.backgroundColor = .white
        
        let loadingIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
        loadingIndicator.center = loadingView.center
        loadingIndicator.color = .navyBlue
        loadingIndicator.startAnimating()
        
        loadingView.addSubview(loadingIndicator)
        view.addSubview(loadingView)
    }
    
    func hideLoadingView(tableView: UITableView) {
        tableView.separatorColor = .backgroundGray
        tableView.refreshControl?.endRefreshing()
        
        let loadingView = self.view.viewWithTag(42)
        
        UIView.animate(withDuration: 0.25, animations: {
            loadingView?.alpha = 0
        }, completion: { _ in
            loadingView?.removeFromSuperview()
        })
    }
}
