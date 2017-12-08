//
//  User.swift
//  GitPatch
//
//  Created by Rolland Cédric on 04.12.17.
//  Copyright © 2017 Rolland Cédric. All rights reserved.
//

import Foundation

struct User: Codable {
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("users")
    
    var login: String
    var id: Int
    var url: String
    var avatarUrl: String
    var followersUrl: String
    var reposUrl: String
    var location: String?
    var repos: Int?
    var followers: Int?
    var following: Int?
    
    init(login: String, id: Int, url: String, avatarUrl: String, followersUrl: String, reposUrl: String, location: String?, repos: Int?, followers: Int?, following: Int?) {
        self.login = login
        self.id = id
        self.url = url
        self.avatarUrl = avatarUrl
        self.followersUrl = followersUrl
        self.reposUrl = reposUrl
        self.location = location
        self.repos = repos
        self.followers = followers
        self.following = following
    }
    
    init?(withJson json: [String : Any]?) {
        if let login = json?["login"] as? String,
            let id = json?["id"] as? Int,
            let url = json?["url"] as? String,
            let avatarUrl = json?["avatar_url"] as? String,
            let followersUrl = json?["followers_url"] as? String,
            let reposUrl = json?["repos_url"] as? String {

            self.login = login
            self.id = id
            self.url = url
            self.avatarUrl = avatarUrl
            self.followersUrl = followersUrl
            self.reposUrl = reposUrl
        } else {
            return nil
        }

        location = json?["location"] as? String
        repos = json?["public_repos"] as? Int
        followers = json?["followers"] as? Int
        following = json?["following"] as? Int
    }
}
