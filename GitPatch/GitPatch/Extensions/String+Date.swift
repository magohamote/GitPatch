//
//  String+Date.swift
//  GitPatch
//
//  Created by Rolland Cédric on 07.12.17.
//  Copyright © 2017 Rolland Cédric. All rights reserved.
//

import Foundation

extension String {
    func toDateFormat() -> String? {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let date: Date? = dateFormatterGet.date(from: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        if let date = date {
            return dateFormatter.string(from: date)
        }
        return nil
    }
}
