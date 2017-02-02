//
//  ResponseResult.swift
//  MantleSwiftExample
//
//  Created by Yury Radchenko on 29.01.17.
//  Copyright © 2017 Yury Radchenko. All rights reserved.
//

enum ResponseResult<T> {
    case success(T)
    case failure(RYError)
}
