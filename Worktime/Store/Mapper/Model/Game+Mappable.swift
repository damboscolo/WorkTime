//
//  Game+Mappable.swift
//  Store
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Foundation
import Domain

extension Game: Mappable {
    init(json: [String : Any]) throws {
        self.id = json["id"] as? Int ?? 0
        self.name = json["name"] as? String ?? ""
        
        guard let imageUrlString = json["image"] as? String,
            let imageURL = URL(string: imageUrlString) else {
                throw NSError()
        }
        
        self.imageURL = imageURL
        
        guard let releaseDateString = json["release_date"] as? String,
            let releaseDate = releaseDateString.toDate() else {
                throw NSError()
        }

        self.releaseDate = releaseDate
        
        guard let trailerUrlString = json["trailer"] as? String,
            let trailerURL = URL(string: trailerUrlString) else {
                throw NSError()
        }
        
        self.trailerURL = trailerURL
        
        let list = try? [Game.Platform].list(from: json)
        self.platforms = list ?? []
    }
}


fileprivate extension String {
    func toDate() -> Date? {
        return Date()
    }
}

fileprivate extension Array where Element == Game.Platform {
    static func list(from json: [String: Any]) throws -> [Game.Platform] {
        var array = [Game.Platform]()
        
        guard let stringArray = json["platforms"] as? [String] else {
            throw NSError()
        }
        
        for string in stringArray {
            guard let platform = Game.Platform.from(string: string) else {
                throw NSError()
            }
            
            array.append(platform)
        }
        
        return array
    }
}

fileprivate extension Game.Platform {
    // swiftlint:disable:next cyclomatic_complexity
    static func from(string: String) -> Game.Platform? {
        switch string {
        case "PC": return .pc
        case "PS3": return .ps3
        case "PS4": return .ps4
        case "X360": return .x360
        case "XONE": return .xOne
        case "LNX": return .linux
        case "MAC": return .mac
        case "Android": return .android
        case "iOS": return .iOS
        case "NS": return .nintendoSwitch
        default: return nil
        }
    }
}
