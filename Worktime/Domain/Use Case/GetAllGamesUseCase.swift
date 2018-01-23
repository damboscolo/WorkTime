//
//  GetAllGamesUseCase.swift
//  Domain
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import RxSwift

public struct GetAllGamesUseCase {
    let repository: GameRepository
}

extension GetAllGamesUseCase: UseCase {
    public typealias Req = Request
    public typealias ReturnType = Game
    
    public func execute(request: Request?) -> Observable<Game> {
        return repository.all()
    }
}

public extension GetAllGamesUseCase {
    public struct Request {
        public init() {}
    }
}
