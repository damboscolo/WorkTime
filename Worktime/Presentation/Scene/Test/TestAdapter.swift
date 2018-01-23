//
//  TestAdapter.swift
//  GameChallenge
//
//  Created by Wagner Augusto on 04/01/18.
//  Copyright (c) 2018 Wagner Augusto. All rights reserved.
//

import UIKit
import Domain
import RxSwift
import RxCocoa

final class TestAdapter: NSObject {
  var dataSet = [ViewModel<Game>]()

  var tableView: UITableView

  init(tableView: UITableView) {
    self.tableView = tableView
    super.init()

    setup(tableView: tableView)
  }
}

extension TestAdapter: TableViewProtocol {
  //Protocol

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.numberOfRows
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: GameCell = tableView.dequeueReusableCell(for: indexPath)
    cell.setup(with: model(for: indexPath))
    return cell
  }
}

extension TestAdapter: TableViewAdapter {
  typealias ModelType = ViewModel<Game>

  func registerCell() {
    tableView.register(cellType: GameCell.self)
  }
}

extension Reactive where Base: TestAdapter {
  var didSelect: Observable< ViewModel<Game> > {
    return base.tableView.rx.itemSelected.asObservable()
      .map({ self.base.model(for: $0) })
  }
}
