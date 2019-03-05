//
//  ViewController.swift
//  Sample
//
//  Created by Boris Bielik on 03/03/2019.
//  Copyright © 2019 Appsode, s.r.o. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var colorSelector: ColorSelector!

    override func viewDidLoad() {
        let colors: [UIColor] = [.red, .black, .blue, .green, .yellow]

        colorSelector = ColorSelector(values: colors, selectedValue: .red)
        tableView.reloadData()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorSelector.values.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath) as? SelectColorTableViewCell else {
            return UITableViewCell()
        }

        let isSelected = colorSelector.selectedIndex == indexPath.row
        cell.accessoryType = isSelected ? .checkmark : .none

        cell.colorView.backgroundColor = colorSelector[indexPath.row]
        cell.label.text = colorSelector.formattedValues[indexPath.row]

        return cell
    }
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        colorSelector.selectValue(at: indexPath.row)
        print("Selected color: \(colorSelector.formattedSelectedValue) at index: \(colorSelector.selectedIndex)")
        tableView.reloadData()
    }

}

