//
//  PeopleListTableViewCell.swift
//  StarWars
//
//  Created by Никита on 30.04.2018.
//  Copyright © 2018 Никита. All rights reserved.
//

import Foundation
import UIKit

class PeopleListTableViewCell : UITableViewCell {
    
    @IBOutlet weak var peopleNameLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var genderImageView: UIImageView!
    @IBOutlet weak var generalView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //        peopleNameLabel.text = ""
        //        birthYearLabel.text = ""
        //        genderImageView.image = UIImage()
    }
    
    func load(with people: String) {
        
    }
    
    //MARK: - Private
    
    private func setup() {
        generalView.cornerRadius(radius: 10)
        generalView.clipsToBounds = false
        generalView.layer.shadowOffset = CGSize(width: 0, height: 2)
        generalView.layer.shadowOpacity = 0.6
        generalView.layer.shadowRadius = 1.0
        generalView.layer.shadowColor = UIColor.black.cgColor
    }
    
}


