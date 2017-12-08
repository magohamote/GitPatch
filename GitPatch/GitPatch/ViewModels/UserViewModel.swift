//
//  UserViewModel.swift
//  GitPatch
//
//  Created by Rolland Cédric on 04.12.17.
//  Copyright © 2017 Rolland Cédric. All rights reserved.
//

import Alamofire
import os.log

protocol UserViewModelDelegate: class {
    func didReceiveUsersList(users: [User])
    func didFailDownloadUsersListWithError(error: Error)
}

class UserViewModel {
        
    weak var delegate: UserViewModelDelegate?
    
    internal var service = Service()
    
    func requestUserList(since: Int) {
        service.requestUserList(since: since, completion: setUsersList)
    }
    
    private func setUsersList(withResponse response: Service.MultipleResult?, error: Error?) {
        guard let response = response else {
            if let error = error {
                delegate?.didFailDownloadUsersListWithError(error: error)
            } else {
                delegate?.didFailDownloadUsersListWithError(error: FormatError.badFormatError)
            }
            return
        }
        var usersArray = [User]()
        
        for data in response {
            if let user = User(withJson: data) {
                usersArray.append(user)
            }
        }
        
        if response.count != usersArray.count {
            delegate?.didFailDownloadUsersListWithError(error: FormatError.badFormatError)
        } else {
            delegate?.didReceiveUsersList(users: usersArray)
        }
    }

    func saveUsers(users: [User]) {
        do {
            var data = Data()
            if users.count > 100 { // I've decided to save up to 100 users for offline stage
                data = try PropertyListEncoder().encode(Array(users[0..<100]))
            } else {
                data = try PropertyListEncoder().encode(users)
            }
            let success = NSKeyedArchiver.archiveRootObject(data, toFile: User.ArchiveURL.path)
            if success {
                os_log("Users successfully saved.", log: OSLog.default, type: .debug)
            } else {
                os_log("Failed to save users.", log: OSLog.default, type: .error)
            }
        } catch {
            os_log("Failed to save users.", log: OSLog.default, type: .error)
        }
    }
    
    func loadUsers() -> [User]? {
        guard let data = NSKeyedUnarchiver.unarchiveObject(withFile: User.ArchiveURL.path) as? Data else { return nil }
        do {
            let users = try PropertyListDecoder().decode([User].self, from: data)
            os_log("Users successfully loaded.", log: OSLog.default, type: .debug)
            return users
        } catch {
            os_log("Failed to load users.", log: OSLog.default, type: .error)
            return nil
        }
    }
}
