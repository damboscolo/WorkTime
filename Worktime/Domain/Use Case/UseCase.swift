//
//  UseCase.swift
//  Domain
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import RxSwift

public protocol UseCase {
    associatedtype ReturnType
    associatedtype Req
    
    func execute(request: Req?) -> Observable<ReturnType>
}

public protocol CompletableUseCase {
    associatedtype Req
    
    func execute(request: Req?) -> Completable
}

public extension CompletableUseCase {
    func execute() -> Completable {
        return execute(request: nil)
    }
}

public extension UseCase {
    func execute() -> Observable<ReturnType> {
        return execute(request: nil)
    }
}
