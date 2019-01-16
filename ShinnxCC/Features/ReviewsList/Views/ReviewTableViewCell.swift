//
//  ReviewTableViewCell.swift
//  ShinnxCC
//
//  Created by Nasir Mahmood on 14.01.19.
//  Copyright © 2019 shinnxstudios. All rights reserved.
//

import UIKit
import Cosmos

class ReviewTableViewCell: UITableViewCell {
    @IBOutlet var starView : CosmosView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
}

// MARK: - ConfigurableView
extension ReviewTableViewCell: ConfigurableView {
    func configure(_ value: Review) {
        starView.rating = Double(value.rating) ?? 0.0
        self.titleLbl.text = value.title
        
        //TODO: Needs natural langugage processine i-e Today, Yesterday, 2 days ago
        self.dateLbl.text = value.date
        
        self.messageLbl.text = value.message
        self.authorLbl.text = value.author
        
        //TODO: lookeup to map country names to proper country codes, temp usage of languageCode key
        self.locationLbl.text = Locale.countryflag(from: value.languageCode)
    }
}

// MARK: - ResuableView
extension ReviewTableViewCell: ResuableView, NibLoadableView {}
