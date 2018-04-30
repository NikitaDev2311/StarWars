//
//  APIConstants.swift
//  StarWars
//
//  Created by Никита on 30.04.2018.
//  Copyright © 2018 Никита. All rights reserved.
//

import Foundation

//let apiKey = "9012450638ca1a926b6b56e8551b4d38"

let host = "https://swapi.co/api"

//let imageUrlPrefix = "https://image.tmdb.org/t/p/w500"

//let videoAppendToResponse = "videos"

public typealias arrayBlock = ([Any]?, String?) -> Void

public typealias objectBlock = (Any?, String?) -> Void

let timeoutInterval = 20.0

public enum ParsingError :String {
    case getDataError = "Can't get data from JSON"
    case parseError = "Can't parse the objects"
}
