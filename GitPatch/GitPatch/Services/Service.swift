//
//  Service.swift
//  GitPatch
//
//  Created by Rolland Cédric on 07.12.17.
//  Copyright © 2017 Rolland Cédric. All rights reserved.
//

import Foundation
import Alamofire
import os.log

class Service { // Manage all API calls
    
    typealias MultipleResult = [[String: Any]]
    typealias UniqueResult = [String: Any]
    private static let userListUrl = "https://api.github.com/users?since="
    
    func requestUserList(since: Int, completion: @escaping (_ response: MultipleResult?, _ error: Error?) -> Void) {
        Alamofire.request("\(Service.userListUrl)\(since)").responseJSON { response in
            
            guard response.result.isSuccess else {
                if let error = response.result.error {
                    os_log("Error while fetching users list: %@", log: OSLog.default, type: .error, "\(error)")
                    completion(nil, error)
                }
                return
            }
            
            guard let responseJSON = response.result.value as? MultipleResult else {
                os_log("Invalid data received from the service", log: OSLog.default, type: .error)
                os_log("data: %@", log: OSLog.default, type: .error, response.result.value.debugDescription)
                completion(nil, FormatError.badFormatError)
                return
            }
            
            completion(responseJSON, nil)
        }
    }
    
    func requestUserFollowers(url: String, completion: @escaping (_ response: MultipleResult?, _ error: Error?) -> Void) {
        Alamofire.request(url).responseJSON { response in
            
            guard response.result.isSuccess else {
                if let error = response.result.error {
                    os_log("Error while fetching followers: %@", log: OSLog.default, type: .error, "\(error)")
                    completion(nil, error)
                }
                return
            }
            
            guard let responseJSON = response.result.value as? MultipleResult else {
                os_log("Invalid data received from the service", log: OSLog.default, type: .error)
                os_log("data: %@", log: OSLog.default, type: .error, response.result.value.debugDescription)
                completion(nil, FormatError.badFormatError)
                return
            }
            
            completion(responseJSON, nil)
        }
    }
    
    func requestUserRepos(url: String, completion: @escaping (_ response: MultipleResult?, _ error: Error?) -> Void) {
        Alamofire.request(url).responseJSON { response in
            
            guard response.result.isSuccess else {
                if let error = response.result.error {
                    os_log("Error while fetching repositories: %@", log: OSLog.default, type: .error, "\(error)")
                    completion(nil, error)
                }
                return
            }
            
            guard let responseJSON = response.result.value as? MultipleResult else {
                os_log("Invalid data received from the service", log: OSLog.default, type: .error)
                os_log("data: %@", log: OSLog.default, type: .error, response.result.value.debugDescription)
                completion(nil, FormatError.badFormatError)
                return
            }
            
            completion(responseJSON, nil)
        }
    }
    
    func requestUserDetails(url: String, completion: @escaping (_ response: UniqueResult?, _ error: Error?) -> Void) {
        Alamofire.request(url).responseJSON { response in
            
            guard response.result.isSuccess else {
                if let error = response.result.error {
                    os_log("Error while fetching user details: %@", log: OSLog.default, type: .error, "\(error)")
                    completion(nil, error)
                }
                return
            }
            
            guard let responseJSON = response.result.value as? UniqueResult else {
                os_log("Invalid data received from the service", log: OSLog.default, type: .error)
                os_log("data: %@", log: OSLog.default, type: .error, response.result.value.debugDescription)
                completion(nil, FormatError.badFormatError)
                return
            }
            
            completion(responseJSON, nil)
        }
    }
}
