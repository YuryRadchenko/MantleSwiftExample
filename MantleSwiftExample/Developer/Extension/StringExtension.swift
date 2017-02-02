//
//  StringExtension.swift
//  MantleSwiftExample
//
//  Created by Yury Radchenko on 30.01.17.
//  Copyright © 2017 Yury Radchenko. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    var count: Int {
        return self.characters.count
    }
    
    var isEmpty: Bool {
        return self.characters.count == 0
    }
    
    var isNotEmpty: Bool {
        return !(self.characters.count == 0)
    }
    
    var html2String: String {
        
        let options = [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType]
        let attributed = try! NSAttributedString(data: data(using: String.Encoding.utf32)!, options: options, documentAttributes: nil)
        let stringProcessed = attributed.string
        return stringProcessed
    }
}
