//
//  NibOwnerLoadable.swift
//  Presentation
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import UIKit

// MARK: Protocol Definition

/**
 Make your UIView subclasses conform to this protocol when:
 - they *are* NIB-based, and
 - this class is used as the XIB's File's Owner
 
 To be able to instantiate them from the NIB in a type-safe manner
 */

protocol NibOwnerLoadable: NibLoadable { }

// MARK: Support for instantiation from NIB

extension NibOwnerLoadable where Self: UIView {

  /**
   Adds content loaded from the nib to the end of the receiver's list of subviews and adds constraints automatically.
   */

  func loadNibContent() {
    Self.nib.instantiate(withOwner: self, options: nil).forEach {
      guard let view = $0 as? UIView else {
        return
      }

      setup(subview: view)
    }

  }

  fileprivate func setup(subview view: UIView) {
    let layoutAttributes: [NSLayoutAttribute] = [.top, .leading, .bottom, .trailing]

    view.translatesAutoresizingMaskIntoConstraints = false

    self.addSubview(view)

    layoutAttributes.forEach { attribute in
      self.addConstraint(NSLayoutConstraint(item: view,
                                            attribute: attribute,
                                            relatedBy: .equal,
                                            toItem: self,
                                            attribute: attribute,
                                            multiplier: 1,
                                            constant: 0.0))
    }
  }
}
