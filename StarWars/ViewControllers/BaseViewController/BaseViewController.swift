//
//  BaseViewController.swift
//  StarWars
//
//  Created by Никита on 30.04.2018.
//  Copyright © 2018 Никита. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController : UIViewController {
    
    lazy var router : Router = {
        Router(self.navigationController)
    }()
    
    
}
