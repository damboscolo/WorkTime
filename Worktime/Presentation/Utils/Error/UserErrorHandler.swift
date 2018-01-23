//
//  UserErrorHandler.swift
//  Presentation
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import UIKit
import RxSwift

protocol UserErrorHandler {
  var errorView: ErrorViewProtocol? { get }
  var errorHandlerViewController: UIViewController? { get }
}

protocol ErrorViewProtocol {
  var errorMessageLabel: UILabel { get }
  var errorMessageTitle: UILabel { get }
  var errorActionButton: UIButton? { get }
  var errorDisposeBag: DisposeBag? { get set }
}

protocol UserErrorMapper {
  func mapError(error: Error) -> MappableError
}
