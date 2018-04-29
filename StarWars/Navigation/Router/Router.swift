//
//  Router.swift
//  StarWars
//
//  Created by Никита on 30.04.2018.
//  Copyright © 2018 Никита. All rights reserved.
//

import Foundation
import UIKit

class Router : NSObject {
    
    private let navigationController : UINavigationController?
    
    //MARK: - Initializer
    
    init(_ navigationController: UINavigationController?) {
        self.navigationController = navigationController
        
    }
    
    //MARK: - Public
    @objc func setRootScreen() {
        let peopleListViewController = navigationControllerFromStoryboard(StoryboardConstants.main, type: PeopleListViewController.self)
        UIApplication.shared.keyWindow?.rootViewController = peopleListViewController
    }
    
    //MARK: - Private
    private func navigationControllerFromStoryboard<T>(_ name: String, type: T.Type) -> UINavigationController {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: T.self)) as? UINavigationController
        assert(viewController != nil, "Can not get \(String(describing:T.self)) from storyboard \(name))")
        return viewController!
    }
    
}
