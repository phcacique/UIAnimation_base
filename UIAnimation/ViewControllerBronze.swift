//
//  ViewController.swift
//  UIAnimation_base
//
//  Created by Pedro Cacique on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class ViewControllerBronze: UIViewController {
    

    @IBOutlet var myView: UIView!
    @IBOutlet weak var world: UIImageView!
    @IBOutlet weak var rocket: UIImageView!
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0){
            self.view.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        } else if (sender.selectedSegmentIndex == 1){
            self.view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        }
        
    }
    
    let rocketTrail = UIBezierPath()
    let trailShape = CAShapeLayer()
    let myEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
    let myStartAnimation = CABasicAnimation(keyPath: "strokeStart")
    let animationGroup = CAAnimationGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //        [.repeat,.autoreverse,.curveEaseIn]
        
        rocketTrail.move(to: CGPoint(x: self.rocket.center.x, y: self.rocket.frame.size.height + self.rocket.frame.height*3))
        UIView.animate(withDuration: 10, delay: 0, options: [.curveLinear] , animations: {
            self.rocket.center.y = self.world.center.y - self.world.frame.size.height/2 - self.rocket.frame.size.height/2
            //            Rodar nave
            //            self.rocket.transform = self.rocket.transform.rotated(by: CGFloat(Double.pi))
        }) { (finished) in
            self.rocket.image = UIImage(named: "rocket2")
            self.trailShape.strokeColor = nil
        }
        
        
        rocketTrail.addLine(to: CGPoint(x: self.rocket.center.x, y: self.world.center.y - self.rocket.frame.height*2))
        
        trailShape.strokeColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        trailShape.lineWidth = 6
        trailShape.path = rocketTrail.cgPath
        trailShape.strokeStart = 0.4
        
        myView.layer.addSublayer(trailShape)
        
        
        myEndAnimation.fromValue = 0.3
        myEndAnimation.toValue = 1.0
        
        myStartAnimation.fromValue = 0.2
        myStartAnimation.toValue = 0.9
        
        animationGroup.animations = [myStartAnimation, myEndAnimation]
        animationGroup.duration = 10
        
        trailShape.add(animationGroup, forKey: "drawLine")
        //        rocketTrail.layer.addSublayer(trailShape)
        
        
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
    }
    
}

