//
//  UIImage+Rendering.swift
//  GitPatch
//
//  Created by Rolland Cédric on 06.12.17.
//  Copyright © 2017 Rolland Cédric. All rights reserved.
//

import UIKit

extension UIImageView {
    
    // Color icons with the color you want
    func rendering(withColor color: UIColor, imageName: String) {
        let image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
        self.image = image
        self.tintColor = color
    }
}
