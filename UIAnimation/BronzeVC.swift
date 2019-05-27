//
//  BronzeVC.swift
//  UIAnimation
//
//  Created by Artur Carneiro on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class BronzeVC: UIViewController {

    @IBOutlet weak var world: UIImageView!
    @IBOutlet weak var rocket: UIImageView!
    
    @IBOutlet weak var myView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        self.world.center.y = self.view.frame.height
        self.world.center.x = self.view.center.x
        self.world.frame.size.width = self.view.frame.size.width
        
        self.rocket.center.x = self.view.center.x
        self.rocket.center.y = self.world.frame.size.height * 2 - self.world.frame.size.height/2 - self.rocket.frame.size.height/2
        self.rocket.frame.size.height = self.view.frame.size.height * 0.15
        
        self.rocket.image = UIImage(named: "rocket2")
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let myPath = UIBezierPath()
        myPath.move(to: CGPoint(x: self.rocket.center.x, y: self.rocket.center.y + self.rocket.frame.size.height))
        myPath.addLine(to: CGPoint(x: self.rocket.center.x, y: self.rocket.center.y - 270))
        
        UIView.animate(withDuration: 2, delay: 0.0, options: [.curveLinear], animations: {
            self.rocket.center.y -= 300
            self.rocket.image = UIImage(named: "rocket")
        }) { (finished) in
            self.rocket.image = UIImage(named: "rocket2")
        }
        

        
        let myShapeLayer = CAShapeLayer()
        myShapeLayer.strokeColor = UIColor.yellow.cgColor
        myShapeLayer.lineWidth = 5
        myShapeLayer.path = myPath.cgPath
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
        self.view.layer.addSublayer(myShapeLayer)
        
    }

    @IBAction func changeBackground(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 1) {
            self.view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        } else {
            self.view.backgroundColor = #colorLiteral(red: 0.2631746531, green: 0.3594709039, blue: 0.4427573681, alpha: 1)
        }
    }
}
