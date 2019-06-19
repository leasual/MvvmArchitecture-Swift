//
//  ApiService.swift
//  MvvmArchitecture-Swift
//
//  Created by James on 2019/6/19.
//  Copyright © 2019 geekdroid. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Moya
import ObjectMapper

typealias MoyaError = Moya.MoyaError

enum ApiError: Error {
    case serverError(response: ErrorResponse)
}

class ApiService: API {
    
}

protocol API {
    
}


