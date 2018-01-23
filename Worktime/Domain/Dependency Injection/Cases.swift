//
//  Cases.swift
//  Domain
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

public enum Cases {
    public static func setup(with container: Container) {
        container.autoregister(GetAllGamesUseCase.self, initializer: GetAllGamesUseCase.init)
    }
}
