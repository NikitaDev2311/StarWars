//
//  StringExtension.swift
//  StarWars
//
//  Created by Никита on 30.04.2018.
//  Copyright © 2018 Никита. All rights reserved.
//

import Foundation

extension String {
    static func string(from intValue: Int) -> String {
        return String(format:"%d", intValue)
    }
}
