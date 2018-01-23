//
//  Rx+MoyaResponse.swift
//  Store
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import RxSwift
import Moya

extension Observable where Element: Moya.Response {
    func mapObject<Object: Mappable>() -> Observable<Object> {
        return self.map({ return try $0.mapObject() })
    }
    
    func mapArray<Object: Mappable>(inside key: String) -> Observable<Object> {
        return self.flatMap({ (response) -> Observable<Object> in
            let array: [Object] = try response.mapArray(inside: key)
            return .from(array)
        })
    }
}
