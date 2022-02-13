//
//  Responable.swift
//  Fishy
//
//  Created by Marasy Phi on 12/2/22.
//

import Foundation

private var _decoder: JSONDecoder = {
    let decoder = JSONDecoder()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    decoder.dateDecodingStrategy = .formatted(dateFormatter)
    return decoder
}()

protocol Responable {
    static func decode(_ data: Data) throws -> Self
}

extension Array : Responable where Element : Decodable {
    
    static func decode(_ data: Data) throws -> Self {
        return try _decoder.decode(Self.self, from: data)
    }
    
}

extension Responable where Self: Decodable {

    static func decode(_ data: Data) throws -> Self {
        return try _decoder.decode(Self.self, from: data)
    }

}
