//
//  Loading.swift
//  Presentation
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Foundation

protocol LoadingProtocol {
  func show(loading: LoadingInfo)
  func hideLoading()
}

enum LoadingInfo {
  case message(String)
  case plain
}
