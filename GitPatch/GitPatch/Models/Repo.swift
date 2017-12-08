//
//  Repo.swift
//  GitPatch
//
//  Created by Rolland Cédric on 05.12.17.
//  Copyright © 2017 Rolland Cédric. All rights reserved.
//

import Foundation

struct Repo: Codable {
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("repos")
    
    var name: String
    var stargazersCount: Int
    var language: String?
    var forksCount: Int
    var repoDescription: String?
    var updatedAt: String
    
    init(name: String, stargazersCount: Int, language: String?, forksCount: Int, repoDescription: String?, updatedAt: String) {
        self.name = name
        self.stargazersCount = stargazersCount
        self.language = language
        self.forksCount = forksCount
        self.repoDescription = repoDescription
        self.updatedAt = updatedAt
    }
    
    init?(withJson json: [String : Any]?) {
        if let name = json?["name"] as? String,
            let stargazersCount = json?["stargazers_count"] as? Int,
            let forksCount = json?["forks_count"] as? Int,
            let updatedAt = json?["updated_at"] as? String {
            
            self.name = name
            self.stargazersCount = stargazersCount
            self.forksCount = forksCount
            self.updatedAt = updatedAt
            self.repoDescription = json?["description"] as? String
            self.language = json?["language"] as? String
        } else {
            return nil
        }
    }
}
