//
//  BaseViewController+Loading.swift
//  Presentation
//
//  Created by Wagner Augusto on 11/01/18.
//  Copyright © 2018 Wagner Augusto. All rights reserved.
//

import UIKit

extension BaseViewController: LoadingProtocol {
  func show(loading: LoadingInfo) {
    guard !self.view.subviews.contains(where: { $0 is LoadingView }) else { return }
    let loadingView = LoadingView(superView: self.view, style: .white, info: loading)
    self.view.bringSubview(toFront: loadingView)
  }

  func hideLoading() {
    guard
      let view = self.view.subviews.first(where: { $0 is LoadingView }),
      let loadingView = view as? LoadingView
      else { return }

    loadingView.removeFromSuperview()
  }

}
