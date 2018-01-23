//
//  Presentation
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import UIKit

// MARK: Protocol definition

/**
 Make your `UITableViewCell` and `UICollectionViewCell` subclasses
 conform to this protocol when they are *not* NIB-based but only code-based
 to be able to dequeue them in a type-safe manner
 */
protocol Reusable: class {
  // The reuse identifier to use when registering and later dequeuing a reusable cell
  static var reuseIdentifier: String { get }
}

// MARK: - Default implementation

extension Reusable {
  // By default, use the name of the class as String for its reuseIdentifier
  static var reuseIdentifier: String {
    return String(describing: self)
  }
}

//------
/**
 Make your `UITableViewCell` and `UICollectionViewCell` subclasses
 conform to this typealias when they *are* NIB-based
 to be able to dequeue them in a type-safe manner
 */
typealias NibReusable = Reusable & NibLoadable
