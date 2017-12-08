//
//  UserDetailsCell.swift
//  GitPatch
//
//  Created by Rolland Cédric on 05.12.17.
//  Copyright © 2017 Rolland Cédric. All rights reserved.
//

import UIKit

class UserDetailsCell: UITableViewCell {
    
    @IBOutlet var userDetailsView: UIView!
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var reposCount: UILabel!
    @IBOutlet var followersCount: UILabel!
    @IBOutlet var followingCounts: UILabel!
    @IBOutlet var locationIconImageView: UIImageView!
    @IBOutlet var locationLabel: UILabel!

    func config(withUser user: User?) {
        if let user = user, let avatarUrl = URL(string: user.avatarUrl) {
            userImageView.sd_setImage(with: avatarUrl, placeholderImage:UIImage(named: "placeholder"), completed: nil)
        }
        userImageView.layer.cornerRadius = 5
        userImageView.layer.masksToBounds = true

        userDetailsView.layer.cornerRadius = 15
        userDetailsView.layer.shadowOffset = CGSize(width: 0, height: 0)
        userDetailsView.layer.shadowRadius = 2
        userDetailsView.layer.shadowOpacity = 0.1

        if let user = user {
            configUserDetails(withUser: user)
        } else {
            locationIconImageView.alpha = 0
            locationLabel.alpha = 0
        }
    }

    func configUserDetails(withUser user: User) {
        if let repos = user.repos, let followers = user.followers, let following = user.following {
            reposCount.text = repos.formattedWithSeparator
            followersCount.text = followers.formattedWithSeparator
            followingCounts.text = following.formattedWithSeparator
        }

        if let location = user.location {
            locationIconImageView.rendering(withColor: .anthracite, imageName: "location")
            locationLabel.text = location
            locationIconImageView.alpha = 1
            locationLabel.alpha = 1
        } else {
            locationIconImageView.alpha = 0
            locationLabel.alpha = 0
        }
    }
}
