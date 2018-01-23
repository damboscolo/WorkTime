//
//  UserError.swift
//  Presentation
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Foundation

enum UserError {
  enum Presentation {
    case none
    case alert(style:UIAlertControllerStyle)
    case toast
    case view(action: String)
  }

  enum Action {
    case terminate
    case none
    case goToSettings
    case onComplete(handler: () -> Void, action: String)
    case tryAgain(handler: () -> Void, action: String)
  }
}

protocol MappableError {
  var presentation: UserError.Presentation { get }
  var action: UserError.Action { get }
  var title: String? { get }
  var message: String? { get }
}

struct DisplayError: MappableError {
  let presentation: UserError.Presentation
  let action: UserError.Action
  let title: String?
  let message: String?
}

extension DisplayError {
  static var generic: DisplayError {
    return DisplayError(presentation: .alert(style: .alert),
                        action: .none,
                        title: "Oops",
                        message: "Ocorreu um erro! Tente novamente mais tarde...")
  }
}
