//
//  TestConfigurator.swift
//  GameChallenge
//
//  Created by Wagner Augusto on 04/01/18.
//  Copyright (c) 2018 Wagner Augusto. All rights reserved.
//

import UIKit
import Swinject
import SwinjectAutoregistration
import Domain

enum TestConfigurator {
  private static var container = Container()
  static func setup(with container: Container) {
    self.container = container

    container.register(TestPresenterProtocol.self) {
      let useCases = TestPresenter.Cases(allGames: $0.resolve(GetAllGamesUseCase.self)!)

      return TestPresenter(controller: $0.resolve(TestControllerProtocol.self)!,
                           useCase: useCases)
    }

    container.register(TestControllerProtocol.self) { _ in
      TestViewController.fromNib()
      }.initCompleted { (resolver, controller) in
        guard let viewController = controller as? TestViewController else { return }
        viewController.presenter = resolver.resolve(TestPresenterProtocol.self)
    }
  }

  static var viewController: TestViewController {
    guard let viewController = container.resolve(TestControllerProtocol.self) as? TestViewController else {
      fatalError("TestViewController dependency injection not satisfied")
    }

    return viewController
  }
}
