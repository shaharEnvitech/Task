//
//  LaunchScreenViewController.swift
//  Envitech
//
//  Created by intellithings on 24/11/2022.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController: UIViewController = storyboard.instantiateViewController(withIdentifier: "ViewController")
        let navCtrl: UINavigationController = UINavigationController(rootViewController: mainViewController)
        
        if let window: UIWindow = SceneDelegate.shared?.window {
            if let rootViewController: UIViewController = window.rootViewController {
                navCtrl.view.frame = rootViewController.view.frame
                navCtrl.view.layoutIfNeeded()
                
                window.rootViewController = navCtrl
            }
        }
    }
}
