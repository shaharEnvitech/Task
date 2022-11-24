//
//  LegendTableCell.swift
//  Envitech
//
//  Created by intellithings on 24/11/2022.
//

import Foundation

import UIKit

class LegendTableCell: UITableViewCell {
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var legendTextLabel: UILabel!
    
    func setCellData(text: String, color: String) {
        legendTextLabel.text = text
        colorView.backgroundColor = Utils.hexStringToUIColor(hex: color)
        colorView.layer.borderWidth = 1
    }
}
