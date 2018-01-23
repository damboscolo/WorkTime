//
//  Game+ViewModel.swift
//  Presentation
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Foundation
import Domain

extension Game: ViewModelling {}

extension ViewModel where Base == Game {

  var title: String { return base.name }

  var platform: String {
    return base.platforms.map { $0.string }.joined(separator: ", ")

  }
  var date: String { return "Lançamento: \(ViewModel.dateFormatter.string(from: base.releaseDate))" }

  var trailer: URL { return base.trailerURL }
  var image: URL { return base.imageURL }

  fileprivate static var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    var dateFormat = DateFormatter.dateFormat(fromTemplate: "dd.MM.yyyy", options: 0, locale: nil)
    dateFormat = dateFormat?.replacingOccurrences(of: "-", with: ".")
    formatter.dateFormat = dateFormat
    return formatter
  }
}

fileprivate extension Game.Platform {
  var string: String {
    switch self {
    case .android: return "Android"
    case .pc: return "Windows"
    case .ps3: return "PS3"
    case .ps4: return "PS4"
    case .x360: return "Xbox 360"
    case .xOne: return "Xbox One"
    case .linux: return "Linux"
    case .mac: return "MacOS"
    case .iOS: return "iOS"
    case .nintendoSwitch: return "Nintendo Switch"
    }

  }
}
