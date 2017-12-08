//
//  MockService.swift
//  GitPatchTests
//
//  Created by Rolland Cédric on 07.12.17.
//  Copyright © 2017 Rolland Cédric. All rights reserved.
//

import Foundation
import Alamofire

@testable import GitPatch

class MockService: Service {
    
    typealias MultipleResult = [[String: Any]]
    typealias UniqueResult = [String: Any]
    
    private static let userListUrl = "https://api.github.com/users?since="
    
    private var htmlResponse = HTTPURLResponse(url: NSURL(string: "dummyURL")! as URL, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)
    
    override func requestUserList(since: Int, completion: @escaping (_ response: MultipleResult?, _ error: Error?) -> Void) {
        
        var name = ""
        
        switch since {
        case 0:
            name = "users_list"
        case 1:
            name = "bad_users_list"
        case 2:
            name = "bad_json"
        default:
            name = ""
        }
        
        let data = getTestData(name: name)
        MockRequest.response.data = htmlResponse
        
        do {
            MockRequest.response.json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as AnyObject
        } catch {
            completion(nil, FormatError.badFormatError)
            return
        }
        
        _ = request("dummyURL").responseJSON { (request, response, JSON, error) -> Void in
            if let jsonData = JSON as? MockService.MultipleResult {
                completion(jsonData, nil)
            } else {
                completion(nil, FormatError.badFormatError)
            }
        }
    }
    
    override func requestUserFollowers(url: String, completion: @escaping (_ response: MultipleResult?, _ error: Error?) -> Void) {
        let data = getTestData(name: url)
        MockRequest.response.data = htmlResponse
        
        do {
            MockRequest.response.json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as AnyObject
        } catch {
            completion(nil, FormatError.badFormatError)
            return
        }
        
        _ = request("dummyURL").responseJSON { (request, response, JSON, error) -> Void in
            if let jsonData = JSON as? MockService.MultipleResult {
                completion(jsonData, nil)
            } else {
                completion(nil, FormatError.badFormatError)
            }
        }
    }
    
    override func requestUserRepos(url: String, completion: @escaping (_ response: MultipleResult?, _ error: Error?) -> Void) {
        let data = getTestData(name: url)
        MockRequest.response.data = htmlResponse
        
        do {
            MockRequest.response.json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as AnyObject
        } catch {
            completion(nil, FormatError.badFormatError)
            return
        }
        
        _ = request("dummyURL").responseJSON { (request, response, JSON, error) -> Void in
            if let jsonData = JSON as? MockService.MultipleResult {
                completion(jsonData, nil)
            } else {
                completion(nil, FormatError.badFormatError)
            }
        }
    }
    
    override func requestUserDetails(url: String, completion: @escaping (_ response: UniqueResult?, _ error: Error?) -> Void) {
        let data = getTestData(name: url)
        MockRequest.response.data = htmlResponse
        
        do {
            MockRequest.response.json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as AnyObject
        } catch {
            completion(nil, FormatError.badFormatError)
            return
        }
        _ = request("dummyURL").responseJSON { (request, response, JSON, error) -> Void in
            if let jsonData = JSON as? MockService.UniqueResult {
                completion(jsonData, nil)
            } else {
                completion(nil, FormatError.badFormatError)
            }
        }
    }
    
    private func request(
        _ url: URLConvertible,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil) -> MockRequest {
        
        return MockRequest(request: url as! String)
    }
    
    private func getTestData(name: String) -> Data? {
        let testBundle = Bundle(for: type(of: self))
        let path = testBundle.path(forResource: name, ofType: "json")
        return try? Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped)
    }
}
