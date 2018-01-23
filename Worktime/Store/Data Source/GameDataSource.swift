//
//  GameDataSource.swift
//  Store
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Domain
import Moya
import RxMoya
import RxSwift

struct GameDataSource {
    let provider: MoyaProvider<DropboxProvider>
}

extension GameDataSource {
    func getAllGames() -> Observable<Game> {
        return provider.rx
        .request(.allGames)
        .asObservable()
        .mapArray(inside: "games")
    }
}
