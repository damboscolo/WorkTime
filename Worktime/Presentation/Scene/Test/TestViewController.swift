//
//  TestViewController.swift
//  GameChallenge
//
//  Created by Wagner Augusto on 04/01/18.
//  Copyright (c) 2018 Wagner Augusto. All rights reserved.
//

import UIKit
import Domain
import RxSwift

final class TestViewController: BaseViewController {

  var presenter: TestPresenterProtocol!
  lazy var adapter = TestAdapter(tableView: tableView)
  @IBOutlet var tableView: UITableView!

  override public func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Jogos"
    presenter.askForAllGames()
  }
}

extension TestViewController: NibLoadableViewController { }
extension TestViewController: TestViewProtocol { }
extension TestViewController: TestControllerProtocol { }
