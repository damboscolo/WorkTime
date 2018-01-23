//
//  Loading+Rx.swift
//  Presentation
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Foundation
import RxSwift

extension Observable {
    func show(loading info: LoadingInfo, with loadingPresenter: LoadingProtocol) -> Observable<Element> {
        return self.do(onNext: nil, onError: nil, onCompleted: nil, onSubscribe: {
            loadingPresenter.show(loading: info)
        }, onSubscribed: nil, onDispose: nil)
    }
    
    func hideLoading(with loadingPresenter: LoadingProtocol)  -> Observable<Element> {
        return self.do(onNext: nil, onError: nil, onCompleted: {
            loadingPresenter.hideLoading()
        }, onSubscribe: nil, onSubscribed: nil, onDispose: nil)
    }
}
