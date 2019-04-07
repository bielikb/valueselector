//
//  ColorSelector.swift
//  Sample
//
//  Created by Boris Bielik on 05/03/2019.
//  Copyright © 2019 Appsode, s.r.o. All rights reserved.
//

import Foundation
import ValueSelector

struct ColorSelector: FormattedValueSelector {
    var formattedValues: [String] {
        return values.map { $0.description }
    }

    var formattedSelectedValue: String {
        return selectedValue?.description ?? "No color selected"
    }

    static var emptyValue = UIColor.clear

    let values: [UIColor]
    var selectedValue: UIColor?

    init?(values: [UIColor], selectedValue: UIColor?) {
        self.values = values
        self.selectedValue = selectedValue
    }
}
