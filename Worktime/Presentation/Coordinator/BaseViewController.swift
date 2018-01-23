//
//  BaseViewController.swift
//  Presentation
//
//  Created by Wagner Augusto on 10/01/18.
//  Copyright © 2018 Wagner Augusto. All rights reserved.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
  lazy var disposeBag = DisposeBag()
  lazy var errorDisposeBag = DisposeBag()

  var errorView: ErrorViewProtocol? { return nil }
  var errorHandlerViewController: UIViewController?

  var setupAfterLoad: (() -> Void)?

  override func viewDidLoad() {
    super.viewDidLoad()

    setupAfterLoad?()
  }
}

extension BaseViewController: UserErrorHandler {}
