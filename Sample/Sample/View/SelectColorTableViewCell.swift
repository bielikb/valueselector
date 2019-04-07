//
//  SelectColorTableViewCell.swift
//  Sample
//
//  Created by Boris Bielik on 03/03/2019.
//  Copyright © 2019 Appsode, s.r.o. All rights reserved.
//

import Foundation
import UIKit

let CellIdentifier: String = "color"

final class SelectColorTableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var colorView: UIView!

    override func layoutSubviews() {
        super.layoutSubviews()

        colorView.layer.cornerRadius = colorView.frame.size.height/2
    }
}
