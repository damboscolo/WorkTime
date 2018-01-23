//
//  GameRepository.swift
//  Store
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import RxSwift
import Domain

struct GameRepository {
    let api: GameDataSource
}

extension GameRepository: Domain.GameRepository {
    func all() -> Observable<Game> {
        return api.getAllGames().asObservable()
    }
}
