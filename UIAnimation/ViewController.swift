//
//  ViewController.swift
//  UIAnimation_base
//
//  Created by Pedro Cacique on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var world: UIImageView!
    @IBOutlet weak var rocket: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.world.center.y = self.view.frame.height
        self.world.center.x = self.view.center.x
        self.world.frame.size.width = self.view.frame.size.width
        
        self.rocket.center.x = self.view.center.x
        self.rocket.center.y = self.world.frame.size.height * 2 - self.world.frame.size.height/2 - self.rocket.frame.size.height/2
        self.rocket.frame.size.height = self.view.frame.size.height * 0.15
        
        self.rocket.image = UIImage(named: "rocket2")

      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 2, delay: 0.0, options: [.curveEaseInOut], animations: {
            self.rocket.center.y -= 300
            self.rocket.image = UIImage(named: "rocket")
        }) { (finished) in
            self.rocket.image = UIImage(named: "rocket2")
        }
    }


}

