//
//  ApiResponse.swift
//  portofolio
//
//  Created by Renotech ID on 17/10/23.
//

import Foundation

public enum RequestResult<T>{
    case done(T)
    case failed(message:String)
}
