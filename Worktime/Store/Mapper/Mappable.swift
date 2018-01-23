//
//  Mappable.swift
//  Store
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Foundation

/**
 Using to map from JSON to Model because Codable cannot be used on extensions
 */

protocol Mappable {
    init(json: [String: Any]) throws
}

