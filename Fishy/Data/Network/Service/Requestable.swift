//
//  Requestable.swift
//  Fishy
//
//  Created by Marasy Phi on 12/2/22.
//

import Foundation

public protocol Requestable {
    
    var requestUrl : URL { get }
    
    var path : String? { get }
    var httpMethod : HTTPMethod { get }
    var header : [String: String] { get }
    var parameter : APIRequestParameter? { get }
    
    var timeout : TimeInterval? { get }
}

public enum HTTPMethod : String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
}

public enum APIRequestParameter {
    case body(Data)
    case urlQuery([String : String])
}


extension Dictionary where Key == String, Value == String {
    
    var parameter: APIRequestParameter {
        return .urlQuery(self)
    }
    
}
