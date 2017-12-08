//
//  UserCell.swift
//  GitPatch
//
//  Created by Rolland Cédric on 04.12.17.
//  Copyright © 2017 Rolland Cédric. All rights reserved.
//

import UIKit
import SDWebImage

class UserCell: UITableViewCell {
    
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var rightArrowImageView: UIImageView!
    
    func config(withUser user: User) {
        if let avatarUrl = URL(string: user.avatarUrl) {
            userImageView.sd_setImage(with: avatarUrl, placeholderImage:UIImage(named: "placeholder"), completed: nil)
        }
        userImageView.layer.cornerRadius = userImageView.frame.height/2
        userImageView.layer.masksToBounds = true
        usernameLabel.text = user.login
        usernameLabel.textColor = .anthracite
        rightArrowImageView.rendering(withColor: .navyBlue, imageName: "right-arrow")
    }
}
