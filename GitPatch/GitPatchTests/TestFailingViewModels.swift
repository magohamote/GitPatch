//
//  TestFailingViewModels.swift
//  GitPatchTests
//
//  Created by Rolland Cédric on 07.12.17.
//  Copyright © 2017 Rolland Cédric. All rights reserved.
//

import XCTest
import Foundation
import Alamofire
@testable import GitPatch

class TestFailingViewModels: XCTestCase, UserViewModelDelegate, UserDetailViewModelDelegate, FollowerViewModelDelegate, RepoViewModelDelegate {
    
    var userViewModel: UserViewModel!
    var userDetailViewModel: UserDetailViewModel!
    var followerViewModel: FollowerViewModel!
    var repoViewModel: RepoViewModel!
    
    override func setUp() {
        super.setUp()
        
        userViewModel = UserViewModel()
        userDetailViewModel = UserDetailViewModel()
        followerViewModel = FollowerViewModel()
        repoViewModel = RepoViewModel()
        
        userViewModel.service = MockService()
        userDetailViewModel.service = MockService()
        followerViewModel.service = MockService()
        repoViewModel.service = MockService()
        
        userViewModel.delegate = self
        userDetailViewModel.delegate = self
        followerViewModel.delegate = self
        repoViewModel.delegate = self
    }
    
    override func tearDown() {
        userViewModel = nil
        userDetailViewModel = nil
        followerViewModel = nil
        repoViewModel = nil
        super.tearDown()
    }
    
    // MARK: - User View Model
    
    func testFailingUserViewModel() {
        userViewModel.requestUserList(since: 2)
    }
    
    func didReceiveUsersList(users: [User]) {
        XCTAssertNil(users)
    }
    
    func didFailDownloadUsersListWithError(error: Error) {
        XCTAssertNotNil(error)
        XCTAssertEqual(error.localizedDescription, FormatError.badFormatError.localizedDescription)
    }
    
    // MARK: - User Details View Model
    
    func testFailingUserDetailsViewModel() {
        userDetailViewModel.requestUserDetails(url: "bad_json")
    }
    
    func didReceiveUserDetails(user: User) {
        XCTAssertNil(user)
    }
    
    func didFailDownloadUserDetailsWithError(error: Error) {
        XCTAssertNotNil(error)
        XCTAssertEqual(error.localizedDescription, FormatError.badFormatError.localizedDescription)
    }
    
    // MARK: - Followers View Model
    
    func testFailingFollowersViewModel() {
        followerViewModel.requestUserFollowers(url: "bad_json")
    }
    
    func didReceiveUsersFollowers(followers: [User]) {
        XCTAssertNil(followers)
    }
    
    func didFailDownloadFollowersWithError(error: Error) {
        XCTAssertNotNil(error)
        XCTAssertEqual(error.localizedDescription, FormatError.badFormatError.localizedDescription)
    }
    
    // MARK: - Repos View Model
    func testFailingRepoViewModel() {
        repoViewModel.requestUserRepos(url: "bad_json")
    }
    
    func didReceiveRepos(repos: [Repo]) {
        XCTAssertNil(repos)
    }
    
    func didFailDownloadReposWithError(error: Error) {
        XCTAssertNotNil(error)
        XCTAssertEqual(error.localizedDescription, FormatError.badFormatError.localizedDescription)
    }
}
