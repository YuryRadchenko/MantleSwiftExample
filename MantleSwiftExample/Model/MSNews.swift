//
//  MSNews.swift
//  MantleSwiftExample
//
//  Created by Yury Radchenko on 29.01.17.
//  Copyright © 2017 Yury Radchenko. All rights reserved.
//

import Foundation
import Mantle

class MSNews: MTLModel {
    
    var title = ""
    var pubDateStr = ""
    var pudDateFormated: String {
        let formater = DateFormatter()
        formater.dateFormat = "yyyy-MM-dd HH:mm"
        guard let date = self.pubDate else {
            return ""
        }
        let dateFormated = formater.string(from: date)
        return dateFormated
    }
    var pubDate: Date? {
        return self.convertDate(fromString: self.pubDateStr)
    }
    
    var link = ""
    var guid = ""
    var author = ""
    var contentHtml = ""
    var contentString: String {
        return self.contentHtml.html2String
    }
    var categories: [String] = []
    
    var categoriesDescription: String {
        var returnValue = ""
        for category in self.categories {
            returnValue += category
            if category != self.categories.last {
                returnValue += ", "
            }
        }
        return returnValue
    }
    
    fileprivate func convertDate(fromString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let commentDate = dateFormatter.date(from: fromString)
        return commentDate
    }
}

//MARK: - MTLJSONSerializing -
extension MSNews : MTLJSONSerializing {
    
    class func jsonKeyPathsByPropertyKey() -> [AnyHashable : Any]! {
        let dict = [
            "title":        "title",
            "pubDateStr":   "pubDate",
            "link":         "link",
            "guid":         "guid",
            "author":       "author",
            "contentHtml":  "content",
            "categories":   "categories"
        ]
        return dict
    }
}
