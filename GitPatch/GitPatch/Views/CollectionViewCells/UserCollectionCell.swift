//
//  UserCollectionCell.swift
//  GitPatch
//
//  Created by Rolland Cédric on 05.12.17.
//  Copyright © 2017 Rolland Cédric. All rights reserved.
//

import UIKit

class UserCollectionCell: UICollectionViewCell {
    
    @IBOutlet var userImageShadowView: UIView!
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var usernameLabel: UILabel!
    
    func config(withUser user: User) {
        if let avatarUrl = URL(string: user.avatarUrl) {
            userImageView.sd_setImage(with: avatarUrl, placeholderImage:UIImage(named: "placeholder"), completed: nil)
        }
        userImageView.layer.masksToBounds = true
        userImageView.layer.cornerRadius = userImageView.frame.height/2
        userImageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        userImageView.layer.shadowRadius = 2
        userImageView.layer.shadowOpacity = 0.1
        
        userImageShadowView.clipsToBounds = false
        userImageShadowView.layer.cornerRadius = userImageShadowView.frame.height/2
        userImageShadowView.layer.shadowOffset = CGSize(width: 0, height: 0)
        userImageShadowView.layer.shadowRadius = 3
        userImageShadowView.layer.shadowOpacity = 0.2
        
        usernameLabel.text = user.login
        usernameLabel.textColor = .anthracite
        usernameLabel.adjustsFontSizeToFitWidth = true
    }
}

