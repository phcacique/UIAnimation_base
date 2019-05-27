//
//  PrataViewController.swift
//  UIAnimation
//
//  Created by Lia Kassardjian on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class PrataViewController: UIViewController {

    var rocketInitialY:CGFloat?
    
    @IBOutlet weak var world: UIImageView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rocketInitialY = self.rocket.center.y
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 2.0, animations: {
            self.titleLabel.center.x = self.view.frame.size.width/2
            self.username.center.x = self.view.frame.size.width/2
            self.password.center.x = self.view.frame.size.width/2
            self.enterButton.center.x = self.view.frame.size.width/2
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.rocket.center.x = self.view.center.x
        self.rocket.frame.size.height = self.view.frame.size.height * 0.3
        if let y = rocketInitialY {
            self.rocket.center.y = y
        }
        self.rocket.image = UIImage(named: "rocket2")
        
        
        self.world.frame.size.width = self.view.frame.size.width
        self.world.center.x = self.view.center.x
        self.world.center.y = self.view.frame.height
        
        self.titleLabel.center.x = -200
        
        self.username.center.x = -200
        
        self.password.center.x = -200
        
        self.enterButton.center.x = -200
    }
    
    @IBAction func login(_ sender: Any) {
        UIView.animate(withDuration: 2.0, animations: {
            self.titleLabel.center.x = self.view.frame.size.width + 200
            self.username.center.x = self.view.frame.size.width + 200
            self.password.center.x = self.view.frame.size.width + 200
            self.enterButton.center.x = self.view.frame.size.width + 200
        }, completion: { finished in
            self.animateRocket()
        })
    }
    
    func animateRocket() {
        let trailPath = UIBezierPath()
        trailPath.move(to: CGPoint(x: self.rocket.center.x, y: self.rocket.center.y + self.rocket.frame.size.height/2))
        trailPath.addLine(to: CGPoint(x: self.rocket.center.x, y: self.rocket.frame.size.height/2))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineWidth = 6
        shapeLayer.strokeStart = 0.8
        
        let drawTrailAnimation = CABasicAnimation(keyPath: "strokeEnd")
        drawTrailAnimation.fromValue = 0.1
        drawTrailAnimation.toValue = 1.0
        
        let eraseTrailAnimation = CABasicAnimation(keyPath: "strokeStart")
        eraseTrailAnimation.fromValue = 0.0
        eraseTrailAnimation.toValue = 0.8
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [drawTrailAnimation, eraseTrailAnimation]
        animationGroup.duration = 2.9
        
        UIView.animate(withDuration: 3.0, delay: 0, animations: {
            self.rocket.image = UIImage(named: "rocket")
            self.rocket.center.y = self.rocket.frame.size.height/2
            shapeLayer.add(animationGroup, forKey: "drawLine")
            shapeLayer.path = trailPath.cgPath
            shapeLayer.zPosition = -1
            self.view.layer.addSublayer(shapeLayer)
            animationGroup.beginTime = CACurrentMediaTime() + 0.3
            
        }, completion: { finished in
            shapeLayer.removeFromSuperlayer()
            self.moveToSegue()
        })
    }
    
    func moveToSegue() {
        performSegue(withIdentifier: "newViewController", sender: nil)
    }
}
