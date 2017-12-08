//
//  XCTestCase+GetTestData.swift
//  GitPatchTests
//
//  Created by Rolland Cédric on 07.12.17.
//  Copyright © 2017 Rolland Cédric. All rights reserved.
//

import Foundation
import XCTest

extension XCTestCase {
    func getTestData(name: String) -> Data? {
        let testBundle = Bundle(for: type(of: self))
        let path = testBundle.path(forResource: name, ofType: "json")
        return try? Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped)
    }
}
