//
//  Formatter+Separator.swift
//  GitPatch
//
//  Created by Rolland Cédric on 06.12.17.
//  Copyright © 2017 Rolland Cédric. All rights reserved.
//

import Foundation

extension Formatter {
    
    // format big numbers like 20000 in 20'000
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "'"
        formatter.numberStyle = .decimal
        return formatter
    }()
}

extension BinaryInteger {
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}
