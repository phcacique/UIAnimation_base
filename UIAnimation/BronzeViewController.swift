//
//  BronzeViewController.swift
//  UIAnimation
//
//  Created by Felipe Kaça Petersen on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import Foundation
import UIKit

class BronzeViewController: UIViewController {

    @IBOutlet weak var rocket: UIImageView!
    
    @IBOutlet weak var world: UIImageView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //        [.repeat,.autoreverse,.curveEaseIn]
        UIView.animate(withDuration: 3, delay: 0, options: [.curveLinear] , animations: {
            self.rocket.center.y = 0 + self.rocket.frame.height
//            self.rocket.transform = self.rocket.transform.rotated(by: CGFloat(Double.pi))
        }) { (fineshed) in
            self.rocket.image = UIImage(named: "rocket2")
        }
        
        
        //ROTACAO
        //        let ciclePath = UIBezierPath(arcCenter: self.world.center, radius: self.world.frame.width/2, startAngle: 0, endAngle: .pi*2, clockwise: true)
        //
        //        let animate = CAKeyframeAnimation(keyPath: #keyPath(CALayer.position))
        //
        //        animate.duration = 10
        //        animate.repeatCount = MAXFLOAT
        //        animate.path = ciclePath.cgPath
        //
        //        self.rocket.layer.add(animate, forKey: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.rocket.center.x = self.view.center.x
        self.rocket.frame.size.height = self.view.frame.size.height * 0.1
        self.world.frame.size.width = self.view.frame.size.width
        self.world.center.x = self.view.center.x
        self.world.center.y = self.view.frame.height
        
        createLine()
    }
    
    @IBAction func didChangeValue(_ sender: Any) {
        var color = UIColor.black
        if segmentedControl.selectedSegmentIndex == 0 {
            color = .black
        } else {
            color = .white
        }
        UIView.animate(withDuration: 2) {
            self.view.backgroundColor = color
        }
    }
    
    
    
    func createLine(){
        let myPath = UIBezierPath()
        myPath.move(to: CGPoint(x: self.rocket.center.x , y: self.rocket.center.y))
        myPath.addLine(to: CGPoint(x: self.rocket.center.x, y: self.rocket.frame.height))
        
        let myShapeLayer = CAShapeLayer()
        myShapeLayer.strokeColor = UIColor.lightGray.cgColor
        myShapeLayer.lineWidth = 6
        myShapeLayer.strokeStart = 0.8
        
        myShapeLayer.path = myPath.cgPath
//        self.view.layer.addSublayer(myShapeLayer)
        
//        let myAnimation = CABasicAnimation(keyPath: "strokeEnd")
//        myAnimation.fromValue = 0
//        myAnimation.toValue = 1
//        myAnimation.duration = 2

//        myShapeLayer.add(myAnimation, forKey: "drawLine")
        
        let myEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        myEndAnimation.fromValue = 0.2
        myEndAnimation.toValue = 1.0
        
        //E em seguida, a que apaga
        let myStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        myStartAnimation.fromValue = 0.0
        myStartAnimation.toValue = 0.8
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [myStartAnimation, myEndAnimation]
        animationGroup.duration = 3
        
        myShapeLayer.add(animationGroup, forKey: "drawLine")
        self.view.layer.addSublayer(myShapeLayer)
    }
}

