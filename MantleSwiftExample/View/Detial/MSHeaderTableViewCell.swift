//
//  MSHeaderTableViewCell.swift
//  MantleSwiftExample
//
//  Created by Yury Radchenko on 31.01.17.
//  Copyright © 2017 Yury Radchenko. All rights reserved.
//

import UIKit

class MSHeaderTableViewCell: MSDetailAbstractTableViewCell {

    @IBOutlet weak var headerLabel: UILabel! {
        didSet {
            headerLabel.numberOfLines = 0
            headerLabel.text = ""
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
extension MSHeaderTableViewCell: MSCellConfigureCellTypeAble {
    
    func configure(news: MSNews, cellType: DetailTableModel) {
        
        switch cellType {
            
        case .rowTitle:
            self.headerLabel.text = news.title
            self.headerLabel.textColor = .black
            self.headerLabel.font = UIFont.systemFont(ofSize: 17)
            
        case .rowDate:
            self.headerLabel.text = news.pudDateFormated
            self.headerLabel.textColor = .gray
            self.headerLabel.font = kFontStandard
            
        default:
            self.headerLabel.text = ""
        }
    }
}
