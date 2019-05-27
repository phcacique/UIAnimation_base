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
    
    // para todas as abas da tab bar
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // para cada aba da tab bar
    override func viewDidAppear(_ animated: Bool) {
        
        let circlePath = UIBezierPath(arcCenter: self.world.center,
                                      radius: self.world.frame.width/2,
                                      startAngle: .pi*(-0.5),
                                      endAngle: .pi*2,
                                      clockwise: true)
        
        let animation = CAKeyframeAnimation(keyPath: #keyPath(CALayer.position))
        
        animation.duration = 5
        animation.repeatCount = MAXFLOAT
        animation.path = circlePath.cgPath
        
        
        UIView.animate(withDuration: 2.0, delay: 0, options: [.curveEaseInOut], animations: {
            self.rocket.center.y = self.world.center.y - self.world.frame.size.height/2
            
        }, completion: { finished in
            //self.rocket.transform = self.rocket.transform.rotated(by: CGFloat(Double.pi))
            self.rocket.image = UIImage(named: "rocket2")
            //self.rocket.layer.add(animation, forKey: nil)
        })
        // options: .repeat, .autoreverse
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // bounds - conteudo dentro do frame
        // frame - escala e posicionamento
        // center - movimentacao na tela
        
        self.rocket.center.x = self.view.center.x
        self.rocket.frame.size.height = self.view.frame.size.height * 0.3
        
        self.world.frame.size.width = self.view.frame.size.width
        self.world.center.x = self.view.center.x
        self.world.center.y = self.view.frame.height
    }

}

