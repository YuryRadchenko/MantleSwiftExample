//
//  MSContentTableViewCell.swift
//  MantleSwiftExample
//
//  Created by Yury Radchenko on 01.02.17.
//  Copyright © 2017 Yury Radchenko. All rights reserved.
//

import UIKit
import Foundation

class MSContentTableViewCell: MSDetailAbstractTableViewCell {
    
    @IBOutlet weak var contentLabel: UILabel! {
        didSet {
            contentLabel.numberOfLines = 0
            contentLabel.text = ""
            contentLabel.textColor = .black
            contentLabel.font = kFontStandard
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(content: String) {
        self.contentLabel.text = content
    }
}
