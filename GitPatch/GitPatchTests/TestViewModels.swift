//
//  TestViewModels.swift
//  GitPatchTests
//
//  Created by Rolland Cédric on 07.12.17.
//  Copyright © 2017 Rolland Cédric. All rights reserved.
//

import XCTest
import Foundation
import Alamofire
@testable import GitPatch

class TestViewModels: XCTestCase, UserViewModelDelegate, UserDetailViewModelDelegate, FollowerViewModelDelegate, RepoViewModelDelegate {
    
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
    
    func testUserViewModel() {
        userViewModel.requestUserList(since: 0)
    }
    
    func didReceiveUsersList(users: [User]) {
        XCTAssertNotNil(users)
        XCTAssertEqual(users.count, 10)
        XCTAssertEqual(users[0].login, "mojombo")
        XCTAssertEqual(users[0].id, 1)
        XCTAssertEqual(users[0].url, "https://api.github.com/users/mojombo")
        XCTAssertEqual(users[0].avatarUrl, "https://avatars0.githubusercontent.com/u/1?v=4")
        XCTAssertEqual(users[0].followersUrl, "https://api.github.com/users/mojombo/followers")
        XCTAssertEqual(users[0].reposUrl, "https://api.github.com/users/mojombo/repos")
        XCTAssertNil(users[0].location)
        XCTAssertNil(users[0].repos)
        XCTAssertNil(users[0].followers)
        XCTAssertNil(users[0].following)
    }
    
    func didFailDownloadUsersListWithError(error: Error) {
        XCTAssertNil(error)
    }
    
    // MARK: - User Details View Model
    
    func testUserDetailsViewModel() {
        userDetailViewModel.requestUserDetails(url: "user_details")
    }
    
    func didReceiveUserDetails(user: User) {
        XCTAssertNotNil(user)
        XCTAssertEqual(user.login, "magohamote")
        XCTAssertEqual(user.id, 2428457)
        XCTAssertEqual(user.url, "https://api.github.com/users/magohamote")
        XCTAssertEqual(user.avatarUrl, "https://avatars3.githubusercontent.com/u/2428457?v=4")
        XCTAssertEqual(user.followersUrl, "https://api.github.com/users/magohamote/followers")
        XCTAssertEqual(user.reposUrl, "https://api.github.com/users/magohamote/repos")
        XCTAssertEqual(user.location, "Switzerland")
        XCTAssertEqual(user.repos, 10)
        XCTAssertEqual(user.followers, 5)
        XCTAssertEqual(user.following, 6)
    }
    
    func didFailDownloadUserDetailsWithError(error: Error) {
        XCTAssertNil(error)
    }
    
    // MARK: - Followers View Model
    
    func testFollowersViewModel() {
        followerViewModel.requestUserFollowers(url: "followers")
    }
    
    func didReceiveUsersFollowers(followers: [User]) {
        XCTAssertNotNil(followers)
        XCTAssertEqual(followers.count, 5)
        XCTAssertEqual(followers[0].login, "davidsandoz")
        XCTAssertEqual(followers[0].id, 1535702)
        XCTAssertEqual(followers[0].url, "https://api.github.com/users/davidsandoz")
        XCTAssertEqual(followers[0].avatarUrl, "https://avatars0.githubusercontent.com/u/1535702?v=4")
        XCTAssertEqual(followers[0].followersUrl, "https://api.github.com/users/davidsandoz/followers")
        XCTAssertEqual(followers[0].reposUrl, "https://api.github.com/users/davidsandoz/repos")
        XCTAssertNil(followers[0].location)
        XCTAssertNil(followers[0].repos)
        XCTAssertNil(followers[0].followers)
        XCTAssertNil(followers[0].following)
    }
    
    func didFailDownloadFollowersWithError(error: Error) {
        XCTAssertNil(error)
    }
    
    // MARK: - Repos View Model
    func testRepoViewModel() {
        repoViewModel.requestUserRepos(url: "repos")
    }
    
    func didReceiveRepos(repos: [Repo]) {
        XCTAssertNotNil(repos)
        XCTAssertEqual(repos.count, 2)
        XCTAssertEqual(repos[0].name, "botkit")
        XCTAssertEqual(repos[0].repoDescription, "Botkit is a toolkit for making bot applications")
        XCTAssertEqual(repos[0].updatedAt, "2016-06-28T18:54:21Z")
        XCTAssertEqual(repos[0].stargazersCount, 0)
        XCTAssertEqual(repos[0].language, "JavaScript")
        XCTAssertEqual(repos[0].forksCount, 0)
    }
    
    func didFailDownloadReposWithError(error: Error) {
        XCTAssertNil(error)
    }
}
