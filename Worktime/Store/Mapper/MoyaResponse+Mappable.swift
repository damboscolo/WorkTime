//
//  MoyaResponse+Mappable.swift
//  Store
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Foundation
import Moya

extension Moya.Response {
    func mapObject<T: Mappable>() throws -> T {
        let jsonDict = try self.json()
    
        return try T(json: jsonDict)
    }
    
    private func json() throws -> [String: Any] {
        guard
            let rawJson = try? mapJSON(),
            let json = rawJson as? [String: Any]
            else { throw MoyaError.jsonMapping(self) }
        
        return json
    }
    
    func mapArray<T: Mappable>(inside key: String) throws -> [T] {
        
        guard let jsonDict = try? self.json(),
            let jsonArray = jsonDict[key] as? [[String: Any]]
            else { throw MoyaError.jsonMapping(self) }
        
        return try jsonArray.map({ try T.init(json: $0) })
    }
}
