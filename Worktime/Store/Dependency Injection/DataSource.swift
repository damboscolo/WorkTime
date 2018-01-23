//
//  DataSource.swift
//  Store
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Swinject
import SwinjectAutoregistration
import Moya

public enum DataSource {
    public static func setup(with container: Container) {
        container.register(MoyaProvider<DropboxProvider>.self) { _ in
            MoyaProvider<DropboxProvider>()
        }
        
        container.autoregister(GameDataSource.self, initializer: GameDataSource.init)
    }
}


