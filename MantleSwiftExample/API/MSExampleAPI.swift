//
//  MSExampleAPI.swift
//  MantleSwiftExample
//
//  Created by Yury Radchenko on 29.01.17.
//  Copyright © 2017 Yury Radchenko. All rights reserved.
//

import Foundation

class MSExampleAPI {
    
    static let shared = MSExampleAPI()
    
    private func baseURL(path: String) -> String {
        return MSURL.base + path
    }
    
    func getRSSFeed(completion:@escaping ((ResponseResult<Data>) -> Void)) {
        let requestURL = self.baseURL(path: "rss/hubs")
        let jsonRequestURL = MSURL.rss2json + requestURL
        
        MSExampleORManager.get(requestURL: jsonRequestURL) { (result) in
            completion(result)
        }
    }
}
