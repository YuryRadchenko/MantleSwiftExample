//
//  MSExampleORManager.swift
//  MantleSwiftExample
//
//  Created by Yury Radchenko on 29.01.17.
//  Copyright © 2017 Yury Radchenko. All rights reserved.
//

import Foundation
import Alamofire

class MSExampleORManager {
    
    class func get(requestURL: String, completion:@escaping ((ResponseResult<Data>) -> Void)) {
        
        Alamofire.request(requestURL, method: .get)
        
            .responseData { (response) in
                
                switch response.result {
                case .success(let data):
                    let statusCode = response.response!.statusCode
                    switch statusCode {
                    case 200:
                        DispatchQueue.main.async(){
                            completion(.success(data))
                        }
                        
                    default:
                        DispatchQueue.main.async(){
                            completion(.failure(RYError(scope: .common, code: statusCode)))
                        }
                    }
                    
                case .failure(let error):
                    DispatchQueue.main.async(){
                        completion(.failure(RYError(code: error._code)))
                    }
                }
        }
    }
}
