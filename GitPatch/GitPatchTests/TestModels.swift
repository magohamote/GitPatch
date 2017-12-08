//
//  TestModels.swift
//  GitPatchTests
//
//  Created by Rolland Cédric on 07.12.17.
//  Copyright © 2017 Rolland Cédric. All rights reserved.
//

import XCTest
import Foundation
@testable import GitPatch

class TestModels: XCTestCase {
    
    // MARK: - User Model
    
    func testSuccesfulUserJsonInit() {
        let data = getTestData(name: "user_details")
        
        do {
            let jsonData = try JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any]
            XCTAssertNotNil(User(withJson: jsonData))
        } catch {
            XCTFail()
        }
    }
    
    func testSuccessfulUserInit() {
        XCTAssertNotNil(User.init(login: "test", id: 0, url: "test", avatarUrl: "test", followersUrl: "test", reposUrl: "test", location: "test", repos: 0, followers: 0, following: 0))
    }
    
    func testFailingUserJsonInit() {
        let data = getTestData(name: "bad_user_details")
        
        do {
            let jsonData = try JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any]
            XCTAssertNil(User(withJson: jsonData))
        } catch {
            XCTFail()
        }
    }
    
    // MARK: - Repo Model
    
    func testSuccesfulRepoJsonInit() {
        let data = getTestData(name: "repo")
        
        do {
            let jsonData = try JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any]
            XCTAssertNotNil(Repo(withJson: jsonData))
        } catch {
            XCTFail()
        }
    }
    
    func testSuccessfulRepoInit() {
        XCTAssertNotNil(Repo.init(name: "test", stargazersCount: 0, language: "test", forksCount: 0, repoDescription: "test", updatedAt: "test"))
    }
    
    func testFailingRepoJsonInit() {
        let data = getTestData(name: "bad_repo")
        
        do {
            let jsonData = try JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any]
            XCTAssertNil(Repo(withJson: jsonData))
        } catch {
            XCTFail()
        }
    }
}

