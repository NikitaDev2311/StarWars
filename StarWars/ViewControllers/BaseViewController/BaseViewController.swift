//
//  BaseViewController.swift
//  StarWars
//
//  Created by Никита on 30.04.2018.
//  Copyright © 2018 Никита. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

class BaseViewController : UIViewController {
    
    lazy var router : Router = {
        Router(self.navigationController)
    }()
    
    func showLoading() {
        SVProgressHUD.setBackgroundColor(UIColor.clear)
        SVProgressHUD.setForegroundColor(UIColor.white)
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
        SVProgressHUD.setRingThickness(5.0)
        SVProgressHUD.show()
    }
    
    func hideLoading() {
        SVProgressHUD.dismiss()
    }
    
    func showAlertMessage(with error: String, title: String? = nil) {
        let alertController = UIAlertController(title: title == nil ? AlertTitles.errorAlertTitle : title, message: error, preferredStyle: .alert)
        let okAction = UIAlertAction(title:AlertTitles.okButtonTitle, style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
}
