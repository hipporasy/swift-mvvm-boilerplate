//
//  FishService.swift
//  Fishy
//
//  Created by Marasy Phi on 12/2/22.
//

import Foundation

struct FishService : ServiceDispatchable {
    
    typealias TRequestable = FishyApi
    
    let session: URLSession
    
}

extension FishService : ServiceRequestable {
    
}
