//
//  BaseViewController.swift
//  Presentation
//
//  Created by Wagner Augusto on 04/01/18.
//  Copyright © 2018 Wagner Augusto. All rights reserved.
//

import UIKit

public protocol NibLoadableViewController {}

public extension NibLoadableViewController where Self: UIViewController {

  public static func fromNib() -> Self {
    return Self.init(nibName: String(describing: self), bundle: Bundle(for: self))
  }
}
