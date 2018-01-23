//
//  UserError+Generic.swift
//  Presentation
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Foundation

enum UnknownError: Error { case generic }

extension UnknownError: MappableError {
  var presentation: UserError.Presentation {
    return .alert(style: .alert)
  }

  var action: UserError.Action { return .none }

  var title: String? { return "Oops!" }
  var message: String? { return "Um erro ocorreu! Tente novamente mais tarde" }
}
