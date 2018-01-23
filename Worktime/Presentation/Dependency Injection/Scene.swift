//
//  Scene.swift
//  Presentation
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Swinject
import SwinjectAutoregistration
import RxSwift

public enum Scene {
    public static func setup(with container: Container) {
        container.register(DisposeBag.self) { _ in return DisposeBag() }
        TestConfigurator.setup(with: container)
    }
}
