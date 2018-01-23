//
//  LoadingVIew.swift
//  Presentation
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import UIKit
import PureLayout

final class LoadingView: UIView {

  fileprivate lazy var messageLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.textColor = .white
    label.textAlignment = .center
    return label
  }()

  fileprivate lazy var indicator: UIActivityIndicatorView = {
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
    activityIndicator.startAnimating()
    return activityIndicator
  }()

  convenience init(superView: UIView, style: UIActivityIndicatorViewStyle, info: LoadingInfo) {
    self.init(frame: superView.bounds)

    self.backgroundColor = UIColor(white: 0.0, alpha: 0.70)

    switch info {
    case .message(let message): setup(with: message)
    case .plain: setupPlain()
    }

    superView.addSubview(self)
    self.autoPinEdgesToSuperviewEdges()
  }

}

fileprivate extension LoadingView {
  func setupPlain() {
    self.addSubview(indicator)
    indicator.translatesAutoresizingMaskIntoConstraints = false
    indicator.autoCenterInSuperview()
  }

  func setup(with message: String) {

    setupPlain()

    messageLabel.text = message

    self.addSubview(messageLabel)
    messageLabel.translatesAutoresizingMaskIntoConstraints = false
    messageLabel.autoMatch(.width, to: .width, of: self, withOffset: 8.0)
    messageLabel.autoAlignAxis(.vertical, toSameAxisOf: self)
    messageLabel.autoPinEdge(.top, to: .bottom, of: indicator, withOffset: 8.0)
  }
}
