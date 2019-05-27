//
//  RocketBronzeViewController.swift
//  UIAnimation
//
//  Created by Edgar Sgroi on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class RocketBornzeViewController: UIViewController {
    let myPath = UIBezierPath()
    let myShapeLayer = CAShapeLayer()
    @IBOutlet weak var world: UIImageView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var sgmtChangeSegmented: UISegmentedControl!
    @IBAction func sgmtChangeBackground(_ sender: Any) {
        switch sgmtChangeSegmented.selectedSegmentIndex {
        case 0:
            self.view.backgroundColor = #colorLiteral(red: 0.2039215686, green: 0.2862745098, blue: 0.368627451, alpha: 1)
        case 1:
            self.view.backgroundColor = #colorLiteral(red: 0.9961650968, green: 0.9716222882, blue: 0.8943474154, alpha: 1)
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPath.move(to: CGPoint(x: self.rocket.center.x, y: self.rocket.center.y))
        myPath.addLine(to: CGPoint(x: self.rocket.center.x, y: self.rocket.center.y - self.rocket.center.y))
        
        myShapeLayer.strokeColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        myShapeLayer.lineWidth = 2
        myShapeLayer.path = myPath.cgPath
        self.view.layer.addSublayer(myShapeLayer)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 3.0, delay: 0, animations: {
            self.rocket.image = UIImage(named: "rocket.png")
            self.rocket.center.y = -self.view.frame.size.height
            let myAnimation = CABasicAnimation(keyPath: "strokeEnd")
            myAnimation.fromValue = 0
            myAnimation.toValue = 1
            myAnimation.duration = 2
            self.myShapeLayer.add(myAnimation, forKey: "drawLine")
        }, completion: { finished in
            
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.rocket.center.x = self.view.center.x
        //        self.rocket.frame.size.width = self.view.frame.size.height * 0.30
        
        self.world.frame.size.width = self.view.frame.size.width
        self.world.center.x = self.view.center.x
        self.world.center.y = self.view.frame.height
    }
    
    
}
