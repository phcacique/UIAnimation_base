//
//  SilverViewController.swift
//  UIAnimation
//
//  Created by Zewu Chen on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class SilverViewController: UIViewController {

    
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var world: UIImageView!
    var rocketInitialY:CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rocketInitialY = self.rocket.center.y
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 2, animations: {
            self.titulo.center.x = self.view.frame.size.width/2
            self.username.center.x = self.view.frame.size.width/2
            self.password.center.x = self.view.frame.size.width/2
            self.btnLogin.center.x = self.view.frame.size.width/2
            })
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.titulo.center.x = -200
        self.username.center.x = -200
        self.password.center.x = -200
        self.btnLogin.center.x = -200
        
        self.rocket.center.x = self.view.center.x
        self.rocket.frame.size.height = self.view.frame.size.height * 0.30
        
        if let _ = rocketInitialY{
            self.rocket.center.y = rocketInitialY!
        }
        
        self.world.frame.size.width = self.view.frame.size.width
        self.world.center.x = self.view.center.x
        self.world.center.y = self.view.frame.height
        
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        self.titulo.center.x = -200
        self.username.center.x = -200
        self.password.center.x = -200
        self.btnLogin.center.x = -200
        
        //Animação
        self.rocket.image = UIImage(named: "rocket.png")
        let myPath = UIBezierPath()
        myPath.move(to: CGPoint(x: self.rocket.center.x, y: self.rocket.center.y + 1.5*self.rocket.frame.size.height))
        myPath.addLine(to: CGPoint(x: self.rocket.center.x, y: self.rocket.frame.size.height/2))
        
        let myShapeLayer = CAShapeLayer()
        myShapeLayer.strokeColor = UIColor.white.cgColor
        myShapeLayer.lineWidth = 6
        myShapeLayer.strokeStart = 0.8
        
        let myEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        myEndAnimation.fromValue = 0.2
        myEndAnimation.toValue = 1.0
        
        let myStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        myStartAnimation.fromValue = 0.0
        myStartAnimation.toValue = 0.8
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [myStartAnimation, myEndAnimation]
        animationGroup.duration = 2
        
        myShapeLayer.add(animationGroup, forKey: "drawLine")
        myShapeLayer.path = myPath.cgPath
        myShapeLayer.zPosition = -1
        self.view.layer.addSublayer(myShapeLayer)
        
        UIView.animate(withDuration: 1.8, delay: 0, options: [ .curveEaseIn], animations: {
            
            self.rocket.center.y = self.rocket.frame.size.height/2
            
        }, completion: { finished in
            myShapeLayer.removeFromSuperlayer()
            self.performSegue(withIdentifier: "otherView", sender: nil)
        })
        
    }
}
