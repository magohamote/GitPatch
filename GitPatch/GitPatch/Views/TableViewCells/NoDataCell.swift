//
//  NoDataCell.swift
//  GitPatch
//
//  Created by Rolland Cédric on 06.12.17.
//  Copyright © 2017 Rolland Cédric. All rights reserved.
//

import UIKit

class NoDataCell: UITableViewCell {
    
    @IBOutlet var noDataLabel: UILabel!
    
    func config(withUsername username: String, dataType: String) {
        if Reachability.isConnected {
            noDataLabel.text = "\(username) has no \(dataType) :("
        } else {
            noDataLabel.text = "Your need internet to see \(username)'s \(dataType)"
        }
    }
}
