//
//  ViewController.swift
//  UIAnimation_base
//
//  Created by Pedro Cacique on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class ViewControllerBronze: UIViewController {
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var world: UIImageView!
    @IBOutlet weak var seguimento: UISegmentedControl!
    let myEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
    let myStartAnimation = CABasicAnimation(keyPath: "strokeStart")
    let animationGroup = CAAnimationGroup()
    let myPath = UIBezierPath()
    let myShapeLayer = CAShapeLayer()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //        [.repeat,.autoreverse,.curveEaseIn]
        UIView.animate(withDuration: 3, delay: 3, options: [.curveLinear] , animations: {
            self.rocket.image = UIImage(named: "rocket")
            self.myShapeLayer.strokeStart = 0.9
            
            
            
            
            
        }) { (fineshed) in
            UIView.animate(withDuration: 3, delay: 0, options: [.curveLinear] , animations: {
                self.rocket.center.y = self.rocket.center.y - self.world.center.y
                
                self.myShapeLayer.add(self.animationGroup, forKey: "drawLine")
                self.view.layer.addSublayer(self.myShapeLayer)
                
                
                
                
                
            }) { (fineshed) in
                self.rocket.image = UIImage(named: "rocket2")
                self.myShapeLayer.strokeStart = 0.9
                
            }
            
            
        }
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.rocket.center.x = self.view.center.x
        self.rocket.frame.size.height = self.view.frame.size.height * 0.1
        
        self.world.frame.size.width = self.view.frame.size.width
        self.world.center.x = self.view.center.x
        self.world.center.y = self.view.frame.height
        self.rocket.center.y = self.world.center.y - self.world.frame.size.height/2 - self.rocket.frame.size.height/2
        
        
        myPath.move(to: CGPoint(x: self.rocket.center.x, y: self.world.center.y - self.world.frame.size.height/2 - self.rocket.frame.size.height/2))
        myPath.addLine(to: CGPoint(x: self.rocket.center.x, y: self.rocket.center.y - self.world.center.y))
        
        myShapeLayer.strokeColor = #colorLiteral(red: 0.9444177747, green: 0.6065223217, blue: 0.1750487387, alpha: 1)
        myShapeLayer.lineWidth = 2
        
        
        
        myShapeLayer.path = myPath.cgPath
        myShapeLayer.strokeStart = 0.9
        myShapeLayer.zPosition = -4
        self.view.layer.addSublayer(myShapeLayer)
        
        myEndAnimation.fromValue = 0.1
        myEndAnimation.toValue = 1.0
        
        myStartAnimation.fromValue = 0.0
        myStartAnimation.toValue = 0.9

        animationGroup.animations = [myStartAnimation, myEndAnimation]
        animationGroup.duration = 2.9
        animationGroup.beginTime = CACurrentMediaTime() + 0.25
    }
    
    
    
    
    
    
    
    
    
    @IBAction func ChangeBGColor(_ sender: Any) {
        if seguimento.selectedSegmentIndex == 0{
            view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
        if seguimento.selectedSegmentIndex == 1{
            view.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        }
    }
    
    
    
}

