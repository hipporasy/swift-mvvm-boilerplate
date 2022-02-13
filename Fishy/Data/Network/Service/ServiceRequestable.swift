//
//  ServiceRequestable.swift
//  Fishy
//
//  Created by Marasy Phi on 12/2/22.
//

import Combine

protocol ServiceRequestable {
    
    func internalExecute<T>(_ request: Requestable) async throws -> T where T: Responable
    
}
