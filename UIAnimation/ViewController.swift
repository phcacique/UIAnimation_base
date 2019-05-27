//
//  ViewController.swift
//  UIAnimation_base
//
//  Created by Pedro Cacique on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rocketImg: UIImageView!
    @IBOutlet weak var worldImg: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.rocketImg.center.x = self.view.center.x
        self.rocketImg.frame.size.height = self.view.frame.size.height * 0.1
        self.worldImg.frame.size.width = self.view.frame.size.width
        self.worldImg.center.x = self.view.center.x
        self.worldImg.center.y = self.view.frame.size.height
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 4, delay: 0.0, options: [], animations: {
            self.rocketImg.center.y += self.worldImg.frame.size.height/2
            
        }, completion: { (finished) in
            self.rocketImg.image = UIImage(named:"rocket2")
            
            
        })
        
        
    
            }


}

