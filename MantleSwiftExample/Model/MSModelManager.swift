//
//  MSModelManager.swift
//  MantleSwiftExample
//
//  Created by Yury Radchenko on 29.01.17.
//  Copyright © 2017 Yury Radchenko. All rights reserved.
//

import Foundation
import Mantle
import SwiftyJSON

class MSModelManager {
    
    static let shared = MSModelManager()
    
    func getFeed(completion:@escaping (ResponseResult<[MSNews]>) -> Void) {
        
        MSExampleAPI.shared.getRSSFeed { (result) in
            switch result {
            case .success(let data):

                let json = JSON(data: data)
                if let news = try? MTLJSONAdapter.models(of: MSNews.self, fromJSONArray: json["items"].arrayObject) as? [MSNews] {
                    
                    DispatchQueue.main.async(){
                        completion(.success(news!))
                    }
                    
                } else {
                    DispatchQueue.main.async(){
                        completion(.failure(RYError(code: 425)))
                    }
                }

            case .failure(let error):
                print(error.discription)
                DispatchQueue.main.async(){
                    completion(.failure(error))
                }
            }
        }
    }
}

