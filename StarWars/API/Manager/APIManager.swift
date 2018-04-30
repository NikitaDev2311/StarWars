//
//  APIManager.swift
//  StarWars
//
//  Created by Никита on 30.04.2018.
//  Copyright © 2018 Никита. All rights reserved.
//

import Foundation
import Alamofire

public typealias responseBlock = (DataResponse<Any>?, String?) -> Void

class APIManager {
    
    static let shared = APIManager()
    
    private var alamofireManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = timeoutInterval
        configuration.timeoutIntervalForResource = timeoutInterval
        return Alamofire.SessionManager(configuration: configuration)
    }()
    
    func get(methodName: String, parameters : [String : Any], completion: @escaping responseBlock) -> DataRequest {
        
        let url = URL(string: (host + methodName).addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
        return alamofireManager.request(url!, method: .get, parameters: parameters, encoding: URLEncoding.default , headers: nil).responseJSON(completionHandler: { (response) in
            if response.result.isSuccess {
                completion(response, nil)
            }
            else if response.result.isFailure {
                completion(nil, response.error?.localizedDescription)
            }
        })
        
    }
    
}
