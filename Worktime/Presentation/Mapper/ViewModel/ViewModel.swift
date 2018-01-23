//
//  ViewModel.swift
//  Presentation
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Foundation

struct ViewModel<Base> {
  let base: Base
}

protocol ViewModelling {
  /// Extended type
  associatedtype CompatibleType

  static var viewModel: ViewModel<CompatibleType>.Type { get }
  var viewModel: ViewModel<CompatibleType> { get }
}
extension ViewModelling {
  static var viewModel: ViewModel<Self>.Type { return ViewModel<Self>.self }
  var viewModel: ViewModel<Self> { return ViewModel(base: self) }
}
