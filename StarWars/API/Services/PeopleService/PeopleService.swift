//
//  PeopleService.swift
//  StarWars
//
//  Created by Никита on 30.04.2018.
//  Copyright © 2018 Никита. All rights reserved.
//

import Foundation
import ObjectMapper

class PeopleService {
    
    static var shared : PeopleService {
        return PeopleService()
    }
    
    func getPeopleList(_ page : Int, completion: @escaping arrayBlock) {
        let parameters = ["page" : page]
        _ = APIManager.shared.get(methodName: APIMethod.peopleList.rawValue, parameters: parameters, completion: { (response, error) in
            if let error = error {
                completion(nil, error)
            }
            
            guard let dataArray = ResponseParser.parseToDataArray(response) else { completion(nil, ParsingError.parseError.rawValue); return }
            guard let peopleArray = Mapper<People>().mapArray(JSONArray: dataArray) as [People]? else { completion(nil, ParsingError.getDataError.rawValue) }
            
            completion(peopleArray, nil)
        })
    }
    
    
}
