//
//  GameCell.swift
//  Presentation
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import UIKit
import Kingfisher
import Domain

class GameCell: UITableViewCell {

  @IBOutlet var cellImageView: UIImageView!
  @IBOutlet var cellTitle: UILabel!
  @IBOutlet var cellPlatform: UILabel!
  @IBOutlet var cellDate: UILabel!
}

extension GameCell {
  func setup(with game: ViewModel<Game>) {
    cellTitle.text = game.title
    cellPlatform.text = game.platform
    cellDate.text = game.date
    cellImageView.kf.indicatorType = .activity
    cellImageView.kf.setImage(with: game.image)
  }
}
