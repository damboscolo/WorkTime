//
//  UserError+ViewController.swift
//  Presentation
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension UserErrorHandler {
  func handleError(_ error: Error, mapper: UserErrorMapper? = nil) {

    if let mappableError = mapper?.mapError(error: error) {
      handle(mappableError: mappableError)
      return
    }

    if let mappableError = error as? MappableError {
      handle(mappableError: mappableError)
      return
    }

    print("Warning: Not mappable error: \(error)")
  }
}

fileprivate extension UserErrorHandler {
  func handle(mappableError error: MappableError) {

    switch error.presentation {
    case .none: error.completionHandler()
    case .alert(let style): setupAlert(with: error, and: style)
    case .view(let action): setupView(with: error, and: action)
    case .toast: setupToast(with: error)
    }
  }

  func setupView(with error: MappableError, and action: String?) {
    guard var view = errorView else { return }

    view.errorMessageLabel.text = error.message ?? ""
    view.errorMessageTitle.text = error.title ?? "Atenção"

    view.errorDisposeBag = DisposeBag()
    view.errorActionButton?.setTitle(error.actionTitle, for: .normal)
    view.errorActionButton?.rx.tap.asDriver()
      .drive(onNext: error.completionHandler)
      .disposed(by: view.errorDisposeBag!)
  }

  func setupAlert(with error: MappableError, and style: UIAlertControllerStyle) {

    guard let viewController = errorHandlerViewController else { return }

    let alert = UIAlertController(title: error.title ?? "Atenção",
                                  message: error.message ?? "", preferredStyle: style)

    error.actions.forEach { alert.addAction($0) }

    viewController.present(alert, animated: true, completion: nil)
  }

  func setupToast(with error: MappableError) { }
}

extension MappableError {

  fileprivate var actions: [UIAlertAction] {
    switch self.action {
    case .none: return [UIAlertAction.ok]
    case .terminate: return [defaultAction]
    case .goToSettings: return [UIAlertAction.cancel, defaultAction]
    case .onComplete: return [defaultAction]
    case .tryAgain: return [UIAlertAction.ok, defaultAction]
    }
  }

  private var defaultAction: UIAlertAction {
    let handler = completionHandler
    return UIAlertAction(title: actionTitle, style: .default) { _ in handler() }
  }

  fileprivate var actionTitle: String {
    switch self.action {
    case .none: return "Ok"
    case .terminate: return "Sair"
    case .goToSettings: return "Ir para configurações"
    case .onComplete(_, let title): return title
    case .tryAgain(_, let title): return title
    }
  }

  fileprivate func completionHandler() {
    switch self.action {
    case .none: return
    case .terminate: {/* Replace with logoff */ }()
    case .goToSettings: { /* Replace with goToSettings */ }()
    case .onComplete(let handler, _): handler()
    case .tryAgain(let handler, _): handler()
    }
  }

}
