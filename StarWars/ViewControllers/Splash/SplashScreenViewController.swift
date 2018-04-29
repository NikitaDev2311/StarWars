//
//  Splash.swift
//  StarWars
//
//  Created by Никита on 30.04.2018.
//  Copyright © 2018 Никита. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class SplashScreenViewController : BaseViewController {
    
    @IBOutlet weak var splashImageView: UIImageView!
    
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSplashImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setRootScreen(withDelay: 2.0)
    }
    
    //MARK: - Private
    
    fileprivate func setSplashImage() {
        let url = URL(string: splashImageURLString)
        splashImageView.sd_setImage(with: url, completed: nil)
    }
    
    fileprivate func setRootScreen(withDelay delay: TimeInterval) {
        if timer != nil {
            timer?.invalidate()
        }
        timer = Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(someSelector), userInfo: nil, repeats: false)
    }
    
    @objc func someSelector() {
        router.setRootScreen()
    }
}
