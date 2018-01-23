//
//  Configuration.swift
//  Worktime
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Foundation
import Swinject
import Store
import Domain
import Presentation

public enum Configuration {
    
    static var container: Container = Container()
    
    public static func setup() {
        Store.DataSource.setup(with: container)
        Store.Repository.setup(with: container)
        Domain.Cases.setup(with: container)
        Presentation.Scene.setup(with: container)
    }
}

