//
//  TestSaveAndLoadRepos.swift
//  GitPatchTests
//
//  Created by Rolland Cédric on 08.12.17.
//  Copyright © 2017 Rolland Cédric. All rights reserved.
//

import XCTest
import Foundation
import Alamofire
@testable import GitPatch

class TestSaveAndLoadRepos: XCTestCase {
    var repoViewModel: RepoViewModel!
    
    override func setUp() {
        super.setUp()
        repoViewModel = RepoViewModel()
        repoViewModel.service = MockService()
    }
    
    override func tearDown() {
        repoViewModel = nil
        super.tearDown()
    }
    
    func testSaveAndLoadRepos() {
        let data = getTestData(name: "repos")
        
        do {
            if let reposJson = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [[String: Any]] {
                var reposArrayToSave = [Repo]()
                for repoJson in reposJson {
                    if let repo = Repo(withJson: repoJson) {
                        reposArrayToSave.append(repo)
                    } else {
                        XCTFail()
                    }
                }
                repoViewModel.saveRepos(forUserId: "test", repos: reposArrayToSave)
                let loadedReposArray = repoViewModel.loadRepos(forUserId: "test")
                XCTAssertNotNil(loadedReposArray)
                XCTAssertEqual(reposArrayToSave.count, loadedReposArray?.count)
                XCTAssertEqual(reposArrayToSave[0].name, loadedReposArray?[0].name)
                XCTAssertEqual(reposArrayToSave[0].stargazersCount, loadedReposArray?[0].stargazersCount)
                XCTAssertEqual(reposArrayToSave[0].language, loadedReposArray?[0].language)
                XCTAssertEqual(reposArrayToSave[0].forksCount, loadedReposArray?[0].forksCount)
                XCTAssertEqual(reposArrayToSave[0].repoDescription, loadedReposArray?[0].repoDescription)
                XCTAssertEqual(reposArrayToSave[1].name, loadedReposArray?[1].name)
                XCTAssertEqual(reposArrayToSave[1].stargazersCount, loadedReposArray?[1].stargazersCount)
                XCTAssertEqual(reposArrayToSave[1].language, loadedReposArray?[1].language)
                XCTAssertEqual(reposArrayToSave[1].forksCount, loadedReposArray?[1].forksCount)
                XCTAssertEqual(reposArrayToSave[1].repoDescription, loadedReposArray?[1].repoDescription)
            } else {
                XCTFail()
            }
        } catch {
            XCTFail()
        }
    }
    
    func testFailLoadingRepos() {
        XCTAssertNil(repoViewModel.loadRepos(forUserId: "this_path_doesn't_exist"))
    }
}
