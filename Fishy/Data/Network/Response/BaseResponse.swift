//
//  BaseResponse.swift
//  Fishy
//
//  Created by Marasy Phi on 12/2/22.
//

import Foundation

struct BaseResponse<T: Decodable> {
    let data: T?
    let statusCode: Int
    let message: String
}

extension BaseResponse : Decodable { }

extension BaseResponse : Responable { }
