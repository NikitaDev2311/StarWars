//
//  ResponseParser.swift
//  StarWars
//
//  Created by Никита on 30.04.2018.
//  Copyright © 2018 Никита. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ResponseParser {
    class func parseToDataArray(_ fromResponse: DataResponse<Any>?) -> [[String : Any]]? {
        let jsonArray = JSON(fromResponse?.result.value! as Any)
        return jsonArray["results"].arrayObject as? [[String : Any]]
    }
    
    class func parseToDataObject(_ fromResponse: DataResponse<Any>?) -> [String : Any]? {
        let jsonData = JSON(fromResponse?.result.value! as Any)
        return jsonData.dictionaryObject
    }
}
