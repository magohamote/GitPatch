//
//  NavigationController.swift
//  GitPatch
//
//  Created by Rolland Cédric on 04.12.17.
//  Copyright © 2017 Rolland Cédric. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController, UIViewControllerTransitioningDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // background of Navigation Controller is visible during transition
        // so I changed the color to match the rest
        let win = UIApplication.shared.delegate?.window
        win??.backgroundColor = .white
        
        navigationBar.barTintColor = .navyBlue
        navigationBar.isTranslucent = false
        navigationBar.prefersLargeTitles = true
        navigationBar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor : UIColor.white,
            NSAttributedStringKey.font : UIFont(name: "Roboto-Medium", size: 17)!
        ]
        navigationBar.largeTitleTextAttributes = [
            NSAttributedStringKey.foregroundColor : UIColor.white,
            NSAttributedStringKey.font : UIFont(name: "Roboto-Medium", size: 30)!
        ]
    }
}
