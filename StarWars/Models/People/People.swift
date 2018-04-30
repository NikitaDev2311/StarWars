//
//  People.swift
//  StarWars
//
//  Created by Никита on 30.04.2018.
//  Copyright © 2018 Никита. All rights reserved.
//

import Foundation
import ObjectMapper

enum GenderType : String {
    case male = "M"
    case female = "F"
}

class People : BaseModel {
    
    var name            : String?
    var birthYear       : String?
    var gender          : String?
    var mass            : String?
    var height          : String?
    var url             : String?
    var starships       : [Any]?
    var films           : [Any]?
    var vehicles        : [Any]?
    var genderType      : GenderType?
    
    public required init?(map: Map) {
        super.init(map: map)
    }
    
    public override func mapping(map: Map) {
        super.mapping(map: map)
        self.name               <- map["name"]
        self.birthYear          <- map["birth_year"]
        self.gender             <- map["gender"]
        self.mass               <- map["mass"]
        self.height             <- map["height"]
        self.url                <- map["url"]
        self.genderType = gender == maleKey ? GenderType.male : GenderType.female
    }
    
}
