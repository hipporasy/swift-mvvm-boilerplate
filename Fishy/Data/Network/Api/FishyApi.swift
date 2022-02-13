//
//  FishyApi.swift
//  Fishy
//
//  Created by Marasy Phi on 12/2/22.
//

import Foundation

enum FishyApi {
    case fetch
    case fetchDetail(id: String)
}

extension FishyApi : Requestable {
    
    var requestUrl: URL {
        .init(string: "https://api.pettoapp.com/api/v1")!
    }
    
    var path: String? {
        switch self {
        case .fetch:
            return "pet/lists"
        case .fetchDetail(let id):
            return "pet/\(id)"
        }
    }
    
    var httpMethod: HTTPMethod {
        .get
    }
    
    var header: [String : String] {
        [:]
    }
    
    var parameter: APIRequestParameter? {
        .none
    }
    
    var timeout: TimeInterval? {
        60
    }
    
}
