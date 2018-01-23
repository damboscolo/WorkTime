//
//  Game.swift
//  Domain
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

public struct Game {
    public let id: Int
    public let name: String
    public let imageURL: URL
    public let releaseDate: Date
    public let trailerURL: URL
    public let platforms: [Platform]
}

extension Game {
    public enum Platform {
        case pc, ps3, ps4, x360, xOne, linux, mac, android, iOS, nintendoSwitch
    }
}
