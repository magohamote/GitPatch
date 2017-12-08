//
//  RepoCell.swift
//  GitPatch
//
//  Created by Rolland Cédric on 05.12.17.
//  Copyright © 2017 Rolland Cédric. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {
    
    @IBOutlet var cellFloatingView: UIView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var repoDescriptionLabel: UILabel!
    @IBOutlet var languageLabel: UILabel!
    @IBOutlet var languageDotView: UIView!
    @IBOutlet var starsCountLabel: UILabel!
    @IBOutlet var forksCountLabel: UILabel!
    @IBOutlet var updatedAtLabel: UILabel!
    @IBOutlet var forkImageView: UIImageView!
    @IBOutlet var starImageView: UIImageView!
    
    func config(withRepo repo: Repo) {
        cellFloatingView.layer.cornerRadius = 15
        cellFloatingView.layer.shadowOffset = CGSize(width: 0, height: 0)
        cellFloatingView.layer.shadowRadius = 2
        cellFloatingView.layer.shadowOpacity = 0.1
        
        forkImageView.rendering(withColor: .anthracite, imageName: "fork")
        starImageView.rendering(withColor: .anthracite, imageName: "star")
        
        nameLabel.text = repo.name
        nameLabel.textColor = .navyBlue
        languageLabel.text = repo.language
        repoDescriptionLabel.text = repo.repoDescription
        starsCountLabel.text = repo.stargazersCount.formattedWithSeparator
        forksCountLabel.text = repo.forksCount.formattedWithSeparator
        updatedAtLabel.text = "Updated on \(repo.updatedAt.toDateFormat() ?? "unknown")"
        languageDotView.drawDot(withLanguage: repo.language ?? "")
    }
}
