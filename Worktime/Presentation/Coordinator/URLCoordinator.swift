//
//  URLCoordinator.swift
//  Presentation
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Foundation

public struct URLCoordinator {
  public var children = [Coordinator]()
  var url: URL

  public init(url: URL) {
    self.url = url
  }
}

extension URLCoordinator: Coordinator {
  public func start() {
    UIApplication.shared.open(url, options: [String: Any](), completionHandler: nil)
  }

  public func stop() {}
}
