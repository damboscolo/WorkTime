//
//  Repository.swift
//  Store
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Swinject
import SwinjectAutoregistration
import Domain

public enum Repository {
    public static func setup(with container: Container) {
        container.autoregister(Domain.GameRepository.self, initializer: Store.GameRepository.init)
    }
}
