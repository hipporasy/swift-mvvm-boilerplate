//
//  FetchFishUseCase.swift
//  Fishy
//
//  Created by Marasy Phi on 12/2/22.
//

import Foundation

struct FetchFishUseCase: BaseUseCase {
    
    typealias TResult = Fish
    
    private let _repository: FishRepository
    
    init(repository: FishRepository) {
        self._repository = repository
    }
    
    func execute(_ params: Void) async -> Result<Fish, Error> {
        do {
            let result = try await _repository.fetch()
            return Result.success(result)
        } catch (let error) {
            return Result.failure(error)
        }
    }
    
}
