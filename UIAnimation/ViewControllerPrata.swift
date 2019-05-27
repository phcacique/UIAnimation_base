//
//  ViewControllerPrata.swift
//  UIAnimation
//
//  Created by João Henrique Andrade on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class ViewControllerPrata: UIViewController{
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var world: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    
    @IBAction func botaoLogin(_ sender: Any) {
        UIView.animate(withDuration: 2, delay: 0, options: [.curveLinear] , animations: {
            self.stackView.center.x = self.view.center.x - 1000
            self.rocket.image = UIImage.init(named: "rocket")
            self.rocket.center.y = self.view.center.y - 500
            //            Rodar nave
            //            self.rocket.transform = self.rocket.transform.rotated(by: CGFloat(Double.pi))
        }) { (finished) in
            self.rocket.image = UIImage(named: "rocket2")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 5, delay: 0, options: [.curveLinear] , animations: {
            self.stackView.center.x = self.view.center.x
            //            Rodar nave
            //            self.rocket.transform = self.rocket.transform.rotated(by: CGFloat(Double.pi))
        }) { (finished) in
            self.rocket.image = UIImage(named: "rocket2")
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.rocket.center.x = self.view.center.x
        self.rocket.center.y = self.view.frame.height - self.world.frame.height/2
        self.rocket.image = UIImage(named: "rocket2")
        self.stackView.center.x = self.view.center.x - 1000
        self.rocket.frame.size.height = self.view.frame.size.height * 0.1
        self.world.frame.size.width = self.view.frame.size.width
        self.world.center.x = self.view.center.x
        self.world.center.y = self.view.frame.height
    }
}
