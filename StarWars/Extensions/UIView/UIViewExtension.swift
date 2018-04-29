//
//  UIViewExtension.swift
//  StarWars
//
//  Created by Никита on 30.04.2018.
//  Copyright © 2018 Никита. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func cornerRadius(radius : CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
}
