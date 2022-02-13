//
//  BaseUseCase.swift
//  Fishy
//
//  Created by Marasy Phi on 12/2/22.
//

import Foundation

@dynamicCallable
public protocol BaseUseCase {
    
    associatedtype Params = Void
    associatedtype TResult
    
    func execute(_ params: Params) async -> Result<TResult, Error>
    
    func dynamicallyCall(withArguments: [Params]) async -> Result<TResult, Error>
        
}


extension BaseUseCase {
    
    func dynamicallyCall(withArguments: [Params]) async -> Result<TResult, Error> {
        guard withArguments.isEmpty else {
            return await self.execute(withArguments.first!)
        }
        return await self.execute(() as! Self.Params)
    }
    
}

