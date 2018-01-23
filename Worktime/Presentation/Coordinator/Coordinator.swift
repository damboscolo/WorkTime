//
//  Coordinator.swift
//  Presentation
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Foundation

public protocol Coordinator {
  func start()
  func stop()

  var children: [Coordinator] { get set }
}

extension Coordinator {
  func stopAll() {
    stopAllChildren()
    stop()
  }

  func stopAllChildren() {
    children.forEach { $0.stopAll() }
  }
}
