//
//  ViewController.swift
//  UIAnimation_base
//
//  Created by Pedro Cacique on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var world: UIImageView!
    
    //Chama uma vez pra toda tab bar
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //.repeat, .autoreverse
    //Assim que aparece
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.0, delay: 0, options: [ .curveEaseInOut], animations: {

            self.rocket.center.y = self.world.center.y - self.world.frame.size.height/2 - self.rocket.frame.size.height/2

        }, completion: { finished in
            self.rocket.image = UIImage(named: "rocket2.png")
        })

        
        
//        let circlePath = UIBezierPath(arcCenter: self.world.center, radius: self.world.frame.width/2, startAngle: 0, endAngle: .pi*2, clockwise: true)
//
//        let animation = CAKeyframeAnimation(keyPath: #keyPath(CALayer.position))
//
//        animation.duration = 2
//        animation.repeatCount = MAXFLOAT
//        animation.path = circlePath.cgPath
//
//        self.rocket.layer.add(animation, forKey: nil)
        
        
        
//        UIView.animate(withDuration: 1.0, delay: 0, options: [ .repeat, .autoreverse], animations: {
//
//            self.rocket.center.y = self.world.center.y - self.world.frame.size.height/2
//            self.rocket.transform = self.rocket.transform.rotated(by: CGFloat(Double.pi))
//
//        }, completion: { finished in
//            self.rocket.image = UIImage(named: "rocket2.png")
//        })
        

    }
    
    //Antes que aparece
    override func viewWillAppear(_ animated: Bool) {
        //bounds - conteúdo dentro do frame
        //frame - escala e posicionamento
        //center - movimentação na tela
        
        self.rocket.center.x = self.view.center.x
        self.rocket.frame.size.height = self.view.frame.size.height * 0.15
        
        self.world.frame.size.width = self.view.frame.size.width
        self.world.center.x = self.view.center.x
        self.world.center.y = self.view.frame.height
        
    }


}

