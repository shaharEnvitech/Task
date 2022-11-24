//
//  LegendViewController.swift
//  Envitech
//
//  Created by intellithings on 24/11/2022.
//

import UIKit

class LegendViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tags: [Tag] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "LegendTableCell", bundle: nil) , forCellReuseIdentifier: "LegendTableCell")

        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.borderWidth = 2
        tableView.layer.borderColor = UIColor.black.cgColor
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let legendTableCell = tableView.dequeueReusableCell(withIdentifier: "LegendTableCell") as! LegendTableCell
        
        if indexPath.row < tags.count {
            let tag: Tag = tags[indexPath.row]
            legendTableCell.setCellData(text: tag.label, color: tag.color)
        }
        
        legendTableCell.selectionStyle = .none
        
        return legendTableCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tags.count
    }
}
