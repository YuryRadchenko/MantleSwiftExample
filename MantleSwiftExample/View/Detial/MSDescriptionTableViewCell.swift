//
//  MSDescriptionTableViewCell.swift
//  MantleSwiftExample
//
//  Created by Yury Radchenko on 31.01.17.
//  Copyright © 2017 Yury Radchenko. All rights reserved.
//

import UIKit

class MSDescriptionTableViewCell: MSDetailAbstractTableViewCell {

    @IBOutlet weak var headerLabel: UILabel! {
        didSet {
            headerLabel.numberOfLines = 1
            headerLabel.text = ""
            headerLabel.textColor = .gray
            headerLabel.font = kFontStandard
        }
    }
    
    @IBOutlet weak var dataLabel: UILabel! {
        didSet {
            dataLabel.numberOfLines = 0
            dataLabel.text = ""
            dataLabel.textColor = .black
            dataLabel.font = kFontStandard
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

//MARK: - MSConfigureCellAble -
extension MSDescriptionTableViewCell: MSCellConfigureCellTypeAble {
    
    func configure(news: MSNews, cellType: DetailTableModel) {
        
        self.headerLabel.text = cellType.header
        
        switch cellType {
        case .rowAuthor:
            self.dataLabel.text = news.author
        case .rowCategory:
            self.dataLabel.text = news.categoriesDescription
        default:
            headerLabel.text = ""
            dataLabel.text = ""
        }
    }
}
