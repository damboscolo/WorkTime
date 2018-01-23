//
//  TestScene.swift
//  GameChallenge
//
//  Created by Wagner Augusto on 04/01/18.
//  Copyright (c) 2018 Wagner Augusto. All rights reserved.
//

import UIKit
import Domain

protocol TestControllerProtocol: class, UserErrorHandler, LoadingProtocol {
  func display(viewModelList: [ViewModel<Game>])
}

protocol TestViewProtocol: class {
  var adapter: TestAdapter { get }
}

extension TestControllerProtocol where Self: TestViewProtocol {
  func display(viewModelList: [ViewModel<Game>]) {
    adapter.setDataSet(viewModelList)
  }
}
