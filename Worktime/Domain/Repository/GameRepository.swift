//
//  GameRepository.swift
//  Domain
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import RxSwift

public protocol GameRepository {
    func all() -> Observable<Game>
}
