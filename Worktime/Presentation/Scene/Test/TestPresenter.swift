//
//  TestPresenter.swift
//  GameChallenge
//
//  Created by Wagner Augusto on 04/01/18.
//  Copyright (c) 2018 Wagner Augusto. All rights reserved.
//

import UIKit
import Domain
import RxSwift

protocol TestPresenterProtocol {
   func askForAllGames()
}

struct TestPresenter {
  unowned let controller: TestControllerProtocol
  let useCase: Cases
  let disposeBag = DisposeBag()
}

extension TestPresenter {
  struct Cases {
    let allGames: Domain.GetAllGamesUseCase
  }
}

extension TestPresenter: TestPresenterProtocol {

  func askForAllGames() {
    useCase.allGames.execute()
      .show(loading: .message("Carregando jogos..."), with: controller)
      .map { $0.viewModel }
      .toArray()
      .hideLoading(with: controller)
      .subscribe(onNext: { list in
        self.controller.display(viewModelList: list)
      },
                           onError: { error in self.controller.handleError(error, mapper: self) },
                           onCompleted: nil,
                           onDisposed: nil)
    .disposed(by: disposeBag)
  }

}

extension TestPresenter: UserErrorMapper {

  func mapError(error: Error) -> MappableError {
    return DisplayError.generic
  }

}
