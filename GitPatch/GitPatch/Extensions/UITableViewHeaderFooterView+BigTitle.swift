//
//  UITableViewHeaderFooterView+BigTitle.swift
//  GitPatch
//
//  Created by Rolland Cédric on 08.12.17.
//  Copyright © 2017 Rolland Cédric. All rights reserved.
//

import UIKit

extension UITableViewHeaderFooterView {
    
    // Creates a big header in iOS 11 style
    func bigHeader(withTitle title: String) {
        self.contentView.backgroundColor = .backgroundGray
        let labelHeight:CGFloat = 34
        let headerLabel = UILabel(frame: CGRect(x: 20, y: self.frame.height/2 - labelHeight/2 - 5 , width: self.frame.width - 40, height: labelHeight))
        headerLabel.text = title
        headerLabel.font = UIFont(name: "Roboto-Medium", size: 25)
        headerLabel.textColor = .anthracite
        self.addSubview(headerLabel)
    }
}
