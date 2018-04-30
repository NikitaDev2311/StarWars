//
//  DetailView.swift
//  StarWars
//
//  Created by Никита on 30.04.2018.
//  Copyright © 2018 Никита. All rights reserved.
//

import Foundation
import UIKit

protocol DetailViewDelegate : class {
    func detailViewDidTapCloseButton(_ detailView: DetailView)
    func detailViewDidTapOpenBrowserButton(_ detailView: DetailView)
}

class DetailView : UIView {
    
    weak var delegate : DetailViewDelegate?
    
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var starshipsLabel: UILabel!
    @IBOutlet weak var filmsLabel: UILabel!
    @IBOutlet weak var vehiclesLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var browserButton: UIButton!
    
//    let selfHieght = UIScreen.main.bounds.height < screenHeightPlusVersion ? UIScreen.main.bounds.height / 2 : UIScreen.main.bounds.height / 3
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func load(with people: People) {
        self.fullnameLabel.text = people.name
        self.infoLabel.text = String(format: "%@, %@, %@", people.height ?? "", people.mass ?? "", people.gender ?? "")
    }
    
    //MARK: - Actions
    @IBAction func closeButtonAction(_ sender: Any) {
        delegate?.detailViewDidTapCloseButton(self)
    }
    
    @IBAction func openBrowserButtonAction(_ sender: Any) {
        delegate?.detailViewDidTapOpenBrowserButton(self)
    }
    //MARK: - Private
    
    private func setup() {
        self.frame.size.width = UIScreen.main.bounds.width
        self.cornerRadius(radius: 10)
        browserButton.cornerRadius(radius: 20)
        browserButton.layer.borderColor = UIColor.red.cgColor
        browserButton.layer.borderWidth = 1.0
        browserButton.layer.shadowOffset = CGSize(width: 0, height: 1)
        browserButton.layer.shadowOpacity = 0.6
        browserButton.layer.shadowRadius = 0.5
        browserButton.layer.shadowColor = UIColor.black.cgColor
    }
    
}

