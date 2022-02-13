//
//  FishRepository.swift
//  Fishy
//
//  Created by Marasy Phi on 12/2/22.
//

import Foundation

protocol FishRepository : BaseRepository {
    
    func fetch() async throws -> Fish
    
}

struct FishRepositoryImpl: FishRepository {
    
    let service: FishService
    
    func fetch() async throws -> Fish {
        let response: BaseResponse<Fish> = try await service.execute(.fetch)
        guard let data = response.data else {
            throw FishError.dataIsNil
        }
        return data
    }
    
    
}
