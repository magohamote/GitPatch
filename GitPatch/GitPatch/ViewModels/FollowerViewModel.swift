//
//  FollowerViewModel.swift
//  GitPatch
//
//  Created by Rolland Cédric on 07.12.17.
//  Copyright © 2017 Rolland Cédric. All rights reserved.
//

import Alamofire
import os.log

protocol FollowerViewModelDelegate: class {
    func didReceiveUsersFollowers(followers: [User])
    func didFailDownloadFollowersWithError(error: Error)
}

class FollowerViewModel {
    
    weak var delegate: FollowerViewModelDelegate?
    
    internal var service = Service()
    
    func requestUserFollowers(url: String) {
        service.requestUserFollowers(url: url, completion: setUsersFollowers)
    }
    
    private func setUsersFollowers(withResponse response: Service.MultipleResult?, error: Error?) {
        guard let response = response else {
            if let error = error {
                delegate?.didFailDownloadFollowersWithError(error: error)
            } else {
                delegate?.didFailDownloadFollowersWithError(error: FormatError.badFormatError)
            }
            return
        }
        var followersArray = [User]()
        
        for data in response {
            if let follower = User(withJson: data) {
                followersArray.append(follower)
            }
        }
        
        if response.count != followersArray.count {
            delegate?.didFailDownloadFollowersWithError(error: FormatError.badFormatError)
        } else {
            delegate?.didReceiveUsersFollowers(followers: followersArray)
        }
    }
}

