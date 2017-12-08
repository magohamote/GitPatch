//
//  TestSaveAndLoadUsers.swift
//  GitPatchTests
//
//  Created by Rolland Cédric on 07.12.17.
//  Copyright © 2017 Rolland Cédric. All rights reserved.
//

import XCTest
import Foundation
import Alamofire
@testable import GitPatch

class TestSaveAndLoadUsers: XCTestCase {
    var userViewModel: UserViewModel!
    
    override func setUp() {
        super.setUp()
        userViewModel = UserViewModel()
        userViewModel.service = MockService()
    }
    
    override func tearDown() {
        userViewModel = nil
        super.tearDown()
    }
    
    func testSaveAndLoadUsers() {
        let data = getTestData(name: "users_list")

        do {
            if let usersJson = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [[String: Any]] {
                var usersArrayToSave = [User]()
                for userJson in usersJson {
                    if let user = User(withJson: userJson) {
                        usersArrayToSave.append(user)
                    } else {
                        XCTFail()
                    }
                }
                userViewModel.saveUsers(users: usersArrayToSave)
                let loadedUsersArray = userViewModel.loadUsers()
                XCTAssertNotNil(loadedUsersArray)
                XCTAssertEqual(usersArrayToSave.count, loadedUsersArray?.count)
                XCTAssertEqual(usersArrayToSave[0].login, loadedUsersArray?[0].login)
                XCTAssertEqual(usersArrayToSave[0].id, loadedUsersArray?[0].id)
                XCTAssertEqual(usersArrayToSave[0].url, loadedUsersArray?[0].url)
                XCTAssertEqual(usersArrayToSave[0].avatarUrl, loadedUsersArray?[0].avatarUrl)
                XCTAssertEqual(usersArrayToSave[0].reposUrl, loadedUsersArray?[0].reposUrl)
                XCTAssertEqual(usersArrayToSave[1].login, loadedUsersArray?[1].login)
                XCTAssertEqual(usersArrayToSave[1].id, loadedUsersArray?[1].id)
                XCTAssertEqual(usersArrayToSave[1].url, loadedUsersArray?[1].url)
                XCTAssertEqual(usersArrayToSave[1].avatarUrl, loadedUsersArray?[1].avatarUrl)
                XCTAssertEqual(usersArrayToSave[1].reposUrl, loadedUsersArray?[1].reposUrl)
            } else {
                XCTFail()
            }
        } catch {
            XCTFail()
        }
    }
}
