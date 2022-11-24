//
//  ViewController.swift
//  Envitech
//
//  Created by intellithings on 24/11/2022.
//

import UIKit
import DropDown

class ViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var centerButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    let dropDown: DropDown = DropDown()
    
    private var viewModel: ViewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftButton.titleLabel?.textAlignment = .center
        centerButton.titleLabel?.textAlignment = .center
        rightButton.titleLabel?.textAlignment = .center
        
        leftButton.backgroundColor = .darkGray
        centerButton.backgroundColor = .darkGray
        rightButton.backgroundColor = .darkGray
        leftButton.setTitleColor(.white, for: .normal)
        centerButton.setTitleColor(.white, for: .normal)
        rightButton.setTitleColor(.white, for: .normal)
        
        setupBinders()
        viewModel.fetchData()
    }
    
    private func setupBinders() {
        viewModel.response.bind { [weak self] response in
            if let monitorType: [MonitorType] = response?.monitorType {
                DispatchQueue.main.async {
                    self?.leftButton.setTitle(monitorType[0].monitorTypeDescription, for: .normal)
                    self?.leftButton.tag = monitorType[0].id
                    self?.centerButton.setTitle(monitorType[1].monitorTypeDescription, for: .normal)
                    self?.centerButton.tag = monitorType[1].id
                    self?.rightButton.setTitle(monitorType[2].monitorTypeDescription, for: .normal)
                    self?.rightButton.tag = monitorType[2].id
                    
                }
            }
        }
        
        viewModel.error.bind { error in
            if let error = error {
                print(error)
            }
        }
    }
    
    
    @IBAction func onButtonClicked(_ sender: Any) {
        openMenu(view: sender as! UIView)
    }
    
    func openMenu(view: UIView) {
        dropDown.anchorView = view
        dropDown.direction = .top
        
        dropDown.dataSource = viewModel.getDropDownMenuTitles(monitorTypeId: view.tag)
        dropDown.selectionAction = { [weak self] (index, item) in
            if let data = self?.viewModel.getColorTitles(legendId: index) {
                self?.openColorsPopup(data: data)
            }
        }
        dropDown.show()
    }
    
    func openColorsPopup(data: [Tag]) {
        let popvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LegendViewController") as! LegendViewController
 
        self.addChild(popvc)
        popvc.view.frame = CGRect(x: view.frame.width / 4, y: view.frame.height / 4, width: view.frame.width / 2, height: view.frame.height / 2)
        popvc.tags = data
        
        popvc.view.center = CGPoint(x: view.frame.size.width  / 2,
                                     y: view.frame.size.height / 2)
        
        self.view.addSubview(popvc.view)
        
        popvc.didMove(toParent: self)
    }
}

