//
//  TestCoordinator.swift
//  GameChallenge
//
//  Created by Wagner Augusto on 04/01/18.
//  Copyright (c) 2018 Wagner Augusto. All rights reserved.
//

import UIKit
import RxSwift
import Domain
import AVFoundation

public struct TestCoordinator {
  var viewController = TestConfigurator.viewController
  let disposeBag = DisposeBag()
  public var children = [Coordinator]()

  fileprivate let navigationController: UINavigationController

  public init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
}

extension TestCoordinator: Coordinator {

  public func start() {
    setup()
    navigationController.pushViewController(viewController, animated: true)
  }

  public func stop() {
    stopAllChildren()
    viewController.dismiss(animated: true, completion: nil)
  }

  func setup() {
    viewController.setupAfterLoad = { [unowned viewController] in
      viewController.errorHandlerViewController = viewController

      viewController.adapter.rx.didSelect
        .subscribe(onNext: { URLCoordinator(url: $0.trailer).start() })
        .disposed(by: self.disposeBag)
    }
  }
}
