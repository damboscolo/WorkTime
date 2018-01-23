//
//  TableViewAdapter.swift
//  Presentation
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Foundation

typealias TableViewProtocol = UITableViewDelegate & UITableViewDataSource

protocol TableViewAdapter: class {
  associatedtype ModelType
  var dataSet: [ModelType] { get set }
  var tableView: UITableView { get }
  func registerCell()
}

extension TableViewAdapter where Self: TableViewProtocol {

  func setup(tableView: UITableView) {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.rowHeight = UITableViewAutomaticDimension
    registerCell()
  }

  func setDataSet(_ newDataSet: [ModelType]) {
    dataSet = newDataSet
    tableView.reloadData()
  }

  // Variables

  var numberOfSection: Int { return 1 }
  var numberOfRows: Int { return dataSet.count }

  //Function Helpers

  func model(for indexPath: IndexPath) -> ModelType {
    return dataSet[indexPath.row]
  }

  func isLastSection(_ indexPath: IndexPath) -> Bool {
    guard let sections = numberOfSections?(in: tableView) else {
      return false
    }
    return sections == (indexPath.section + 1)
  }

  func isLastRow(_ indexPath: IndexPath) -> Bool {
    let numberOfRows = tableView(tableView, numberOfRowsInSection: indexPath.section)

    return numberOfRows == (indexPath.row + 1)
  }
}
