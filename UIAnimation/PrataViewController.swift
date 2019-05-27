//
//  PrataViewController.swift
//  UIAnimation
//
//  Created by Felipe Kaça Petersen on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import Foundation
import UIKit

class PrataViewController: UIViewController {
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var world: UIImageView!
    
    @IBOutlet weak var loginStackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 2) {
            self.loginStackView.center.x = self.view.center.x
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.rocket.center.x = self.view.center.x
        self.rocket.frame.size.height = self.view.frame.size.height * 0.1
        self.world.frame.size.width = self.view.frame.size.width
        self.world.center.x = self.view.center.x
        self.world.center.y = self.view.frame.height
        
        self.loginStackView.center.x = -500
    }
    
    
    @IBAction func didTapLogin(_ sender: Any) {
        UIView.animate(withDuration: 3, delay: 0, options: [] , animations: {
            self.loginStackView.alpha = 0
            self.rocket.center.y = 0 + self.rocket.frame.height
        }) { (fineshed) in
        }
        
        
    }
    
}


