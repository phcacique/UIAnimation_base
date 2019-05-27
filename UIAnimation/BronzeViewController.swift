//
//  BronzeViewController.swift
//  UIAnimation
//
//  Created by Lia Kassardjian on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class BronzeViewController: UIViewController {

    @IBOutlet weak var world: UIImageView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var colorSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
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
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.rocket.center.x = self.view.center.x
        self.rocket.frame.size.height = self.view.frame.size.height * 0.3
        
        self.world.frame.size.width = self.view.frame.size.width
        self.world.center.x = self.view.center.x
        self.world.center.y = self.view.frame.height
    }

    @IBAction func changeColor(_ sender: Any) {
        if colorSegmentedControl.selectedSegmentIndex == 0 {
            self.view.backgroundColor = #colorLiteral(red: 0.2630435228, green: 0.3621048033, blue: 0.4428681135, alpha: 1)
        } else {
            self.view.backgroundColor = #colorLiteral(red: 0.2522003353, green: 0.2079242468, blue: 0.450132966, alpha: 1)
        }
    }
}
