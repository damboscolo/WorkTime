//
//  UIAlertAction.swift
//  Presentation
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import UIKit

extension UIAlertAction {
  static var cancel: UIAlertAction {
    return UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
  }

  static var ok: UIAlertAction {
    return UIAlertAction(title: "Ok", style: .default, handler: nil)
  }
}
