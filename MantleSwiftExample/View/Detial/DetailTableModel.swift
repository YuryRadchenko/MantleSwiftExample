//
//  DetailTableModel.swift
//  MantleSwiftExample
//
//  Created by Yury Radchenko on 31.01.17.
//  Copyright © 2017 Yury Radchenko. All rights reserved.
//

import Foundation

enum DetailTableModel: Countable {
    
    case rowTitle
    case rowDate
    case rowAuthor
    case rowCategory
    case rowContent
    
    var header: String {
        switch self {
        case .rowAuthor:
            return "Author"
        case .rowCategory:
            return "Categories"
        default:
            return ""
        }
    }
}
