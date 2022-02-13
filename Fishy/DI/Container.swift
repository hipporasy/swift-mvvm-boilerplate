//
//  Container.swift
//  Fishy
//
//  Created by Marasy Phi on 12/2/22.
//

import Foundation
import Swinject

class Injector {
    
    static let shared = Injector()
    
    private let container: Container
    
    private init() {
        container = Container()
    }
    
    func start() {
        registerService()
        registerRepo()
        registerUseCase()
        registerViewModel()
    }
    
    func resolve<V: BaseView>(_ type: V.Type) -> V {
        return container.resolve(type)!
    }
    
}

extension Injector {
    
    
    func registerService() {
        container.register(URLSession.self) {_ in
            URLSession(configuration: .default)
        }
        container.register(FishService.self) { r in
            FishService(session: r.resolve(URLSession.self)!)
        }
    }
    
    func registerUseCase() {
        container.register(FetchFishUseCase.self) { resolver in
            FetchFishUseCase.init(repository: resolver.resolve(FishRepository.self)!)
        }
    }
    
    func registerRepo() {
        container.register(FishRepository.self) { resolver in
            FishRepositoryImpl(service: resolver.resolve(FishService.self)!)
        }
    }
    
    func registerViewModel() {
        container.register(FishViewModel.self) { resolver in
            FishViewModel()
        }
    }
    
    func registerView() {
        container.register(FishView.self) { resolver in
            FishView(resolver.resolve(FishViewModel.self)!)
        }
    }
    
}

