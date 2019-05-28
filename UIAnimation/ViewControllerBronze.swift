//
//  ViewControllerBronze.swift
//  UIAnimation
//
//  Created by Mariana Lima on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class ViewControllerBronze: UIViewController{
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var world: UIImageView!
    @IBOutlet var fundo: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBAction func funcaoDoBotao(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            fundo.backgroundColor = #colorLiteral(red: 0.3321701288, green: 0.3321786821, blue: 0.3321741223, alpha: 1)
        default:
            fundo.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
   override func viewDidAppear(_ animated: Bool) {
    
    let myPath = UIBezierPath()
    myPath.move(to: CGPoint(x: self.rocket.center.x, y: self.view.frame.height))
    myPath.addLine(to: CGPoint(x: self.view.frame.width/2, y: self.rocket.frame.height/1.25))
    
    let myShapeLayer = CAShapeLayer()
    myShapeLayer.strokeColor = UIColor.white.cgColor
    myShapeLayer.lineWidth = 200
    myShapeLayer.path = myPath.cgPath
    myShapeLayer.strokeStart = 1
    myShapeLayer.zPosition = -1
    myShapeLayer.lineWidth = 2
    
    view.layer.addSublayer(myShapeLayer)

    let myEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
    myEndAnimation.fromValue = 0.2
    myEndAnimation.toValue = 1.0
    
    let myStartAnimation = CABasicAnimation(keyPath: "strokeStart")
    myStartAnimation.fromValue = 0.2
    myStartAnimation.toValue = 0.5
    
    let animationGroup = CAAnimationGroup()
    animationGroup.animations = [myStartAnimation, myEndAnimation]
    animationGroup.duration = 2

    
    myShapeLayer.add(animationGroup, forKey: "drawLine")
    view.layer.addSublayer(myShapeLayer)
    
    UIView.animate(withDuration: 2.0, delay: 0, options: [], animations: {
        self.world.frame.size.width = self.view.frame.width
                self.world.center.y = self.view.frame.height
                self.rocket.frame.size.height = self.view.frame.height * 0.15
                self.rocket.center.x = self.view.center.x
                self.rocket.center.y = self.rocket.frame.height
//               self.rocket.transform = self.rocket.transform.scaledBy(x: 2, y: 2)
//
    }, completion: { finished in
        self.rocket.image = UIImage(named: "rocket2.png" )
      self.outraAnimacao ()
        
                    })
   

    }
    func outraAnimacao() { UIView.animate(withDuration: 2.0, delay: 0, options: [], animations: {
        self.world.frame.size.width = self.view.frame.width
        self.world.center.y = self.view.frame.height
        self.rocket.frame.size.height = self.view.frame.height
        self.rocket.center.x = self.world.center.x
        self.rocket.center.y = self.rocket.frame.height-200
  
    
        

        })
    
        }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.rocket.center.y = self.view.frame.height -
            self.world.frame.height/2

    }
}
