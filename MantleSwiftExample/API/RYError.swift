//
//  RYError.swift
//  MantleSwiftExample
//
//  Created by Yury Radchenko on 29.01.17.
//  Copyright © 2017 Yury Radchenko. All rights reserved.
//

import Foundation

enum RYScope {
    case common
}

class RYError {
    var scope: RYScope = .common
    var code = 200
    
    init() {
    }
    
    init(code: Int) {
        self.scope = .common
        self.code = code
    }
    
    init(scope: RYScope, code: Int) {
        self.scope = scope
        self.code = code
    }
    
    var discription: String {
        var returnValue = ""
        
        switch self.scope {
        case .common:
            if self.code == 400 {
                returnValue = "Bad Request. Try later."
            } else if self.code == 425 {
                returnValue = "Parse error."
            }
        }
        
        if returnValue.characters.count == 0 {
            returnValue = "Server error."
        }
        return returnValue
    }
}
