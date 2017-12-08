//
//  UserDetailViewModel.swift
//  GitPatch
//
//  Created by Rolland Cédric on 05.12.17.
//  Copyright © 2017 Rolland Cédric. All rights reserved.
//

import Alamofire
import os.log

protocol UserDetailViewModelDelegate: class {
    func didReceiveUserDetails(user: User)
    func didFailDownloadUserDetailsWithError(error: Error)
}

class UserDetailViewModel {
    
    weak var delegate: UserDetailViewModelDelegate?
    
    internal var service = Service()

    func requestUserDetails(url: String) {
        service.requestUserDetails(url: url, completion: setUserDetails)
    }
    
    private func setUserDetails(withResponse response: Service.UniqueResult?, error: Error?) {
        guard let response = response else {
            if let error = error {
                delegate?.didFailDownloadUserDetailsWithError(error: error)
            } else {
                delegate?.didFailDownloadUserDetailsWithError(error: FormatError.badFormatError)
            }
            return
        }
        
        if let user = User(withJson: response) {
            delegate?.didReceiveUserDetails(user: user)
        } else {
            delegate?.didFailDownloadUserDetailsWithError(error: FormatError.badFormatError)
        }
    }
}
