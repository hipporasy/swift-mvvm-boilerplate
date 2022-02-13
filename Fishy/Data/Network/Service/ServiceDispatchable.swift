//
//  AsynchronousDispatcher.swift
//  Fishy
//
//  Created by Marasy Phi on 12/2/22.
//

import Foundation
import Combine
private let DefaultTimeout: Double = 60

protocol ServiceDispatchable {
    
    associatedtype TRequestable: Requestable
    
    var session: URLSession { get }
    
    func execute<T>(_ request: TRequestable) async throws -> T where T : Responable
    
}

extension ServiceDispatchable where Self: ServiceRequestable {
    
    func execute<T>(_ request: TRequestable) async throws -> T where T : Responable {
        try await internalExecute(request)
    }
    
    func internalExecute<T>(_ request: Requestable) async throws -> T where T : Responable {
        let urlRequest = self.urlRequest(from: request)
        let (data, _) = try await session.data(for: urlRequest)
        return try T.decode(data)
    }
    
    private func urlRequest(from requestable: Requestable) -> URLRequest {
        
        var url = requestable.requestUrl
        if let path = requestable.path {
            url = url.appendingPathComponent(path)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.timeoutInterval = requestable.timeout ?? DefaultTimeout
        urlRequest.cachePolicy = .reloadIgnoringLocalCacheData
        urlRequest.httpMethod = requestable.httpMethod.rawValue
        requestable.header.forEach { urlRequest.addValue($0.value, forHTTPHeaderField: $0.key) }
        
        if let parameter = requestable.parameter {
            switch parameter {
            case .body(let data):
                urlRequest.httpBody = data
            case .urlQuery(let params):
                var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                components!.queryItems = params.map { URLQueryItem(name: $0.key, value: $0.value) }
                components!.percentEncodedQuery = components!.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
                urlRequest.url = components?.url
            }
        }
        
        return urlRequest
    }
    

}
