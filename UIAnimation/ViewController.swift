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
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 3.0, delay: 0, options: [.curveEaseOut], animations: {
            self.rocket.center.y = self.world.center.y - self.rocket.frame.size.width * 2
        }, completion: { finished in
            self.rocket.image = UIImage(named: "rocket2.png")
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.rocket.center.x = self.view.center.x
//        self.rocket.frame.size.width = self.view.frame.size.height * 0.30
        
        self.world.frame.size.width = self.view.frame.size.width
        self.world.center.x = self.view.center.x
        self.world.center.y = self.view.frame.height
    }


}

