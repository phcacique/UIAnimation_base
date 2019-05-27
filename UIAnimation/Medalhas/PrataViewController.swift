//
//  PrataViewController.swift
//  UIAnimation
//
//  Created by Matheus Gois on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class PrataViewController: UIViewController {

    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var world: UIImageView!
    
    @IBOutlet weak var heading: UILabel!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var login: RoundButton!
    
    
    @IBAction func loginAction(_ button: RoundButton) {
        UIView.animate(withDuration: 0.5, animations: {
            self.login.center.x += self.view.bounds.width
        }) { (fineshed) in
            UIView.animate(withDuration: 0.5, animations: {
                self.password.center.x += self.view.bounds.width
            }) { (fineshed) in
                UIView.animate(withDuration: 0.5, animations: {
                    self.username.center.x += self.view.bounds.width
                }) { (fineshed) in
                    UIView.animate(withDuration: 0.5, animations: {
                        self.heading.center.x += self.view.bounds.width
                    }) { (fineshed) in
                        self.animate()
                    }
                }
            }
        }
        
    }
    let animateDuration:TimeInterval = 3
    var inicio:CGPoint = CGPoint()
    var final:CGPoint = CGPoint()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        self.inicio = CGPoint(x: self.rocket.center.x, y: self.rocket.center.y)
        
        self.rocket.center.y = self.world.center.y - self.world.frame.size.height/2 - self.rocket.frame.size.height/2
        self.final = CGPoint(x: self.rocket.center.x, y: self.rocket.center.y)
        

        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.rocket.center.x = self.view.center.x
        self.rocket.frame.size.height = self.view.frame.size.height * 0.1
        self.world.frame.size.width = self.view.frame.size.width
        self.world.center.x = self.view.center.x
        self.world.center.y = self.view.frame.height
        
        
        //LOGIN
        
        self.heading.center.x  -= view.bounds.width
        self.username.center.x -= view.bounds.width
        self.password.center.x -= view.bounds.width
        self.login.center.x -= view.bounds.width

        
//        UIView.animate(withDuration: 0.5) {
//            self.heading.center.x += self.view.bounds.width
//        }
        UIView.animate(withDuration: 0.5, animations: {
            self.heading.center.x += self.view.bounds.width
        }) { (fineshed) in
            UIView.animate(withDuration: 0.5, animations: {
                self.username.center.x += self.view.bounds.width
            }) { (fineshed) in
                UIView.animate(withDuration: 0.5, animations: {
                    self.password.center.x += self.view.bounds.width
                }) { (fineshed) in
                    UIView.animate(withDuration: 0.5, animations: {
                        self.login.center.x += self.view.bounds.width
                    }) { (fineshed) in
                        print("")
                    }
                }
            }
        }
    }

    
    
    
 
    func animate(){

        UIView.animate(withDuration: self.animateDuration, delay: 0, options: [.curveLinear], animations: {
            self.rocket.center = self.inicio
            self.inicio.y = self.inicio.y + self.rocket.frame.size.height/2 - 15
            self.final.y = self.final.y + self.rocket.frame.size.height/2
            self.animateFire(self.final, self.inicio)
        }) { (finished) in
            self.tabBarController?.selectedIndex = 3
        }
    }
    
    func animateFire(_ inicio: CGPoint, _ final: CGPoint){
        let path = UIBezierPath()
        path.move(to: inicio)
        path.addLine(to: final)
        
        // create shape layer for that path
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.borderColor = #colorLiteral(red: 0.9398906827, green: 0.6463938355, blue: 0.1757641435, alpha: 1)
        shapeLayer.strokeColor = #colorLiteral(red: 0.9420522451, green: 0.7616958618, blue: 0.1926662326, alpha: 1)
        shapeLayer.lineWidth = 3
        shapeLayer.borderWidth = 2
        shapeLayer.path = path.cgPath
        shapeLayer.strokeStart = 1
        
        let lineShapeBorder = CAShapeLayer()
        lineShapeBorder.strokeColor = #colorLiteral(red: 0.9398906827, green: 0.6463938355, blue: 0.1757641435, alpha: 1)
        lineShapeBorder.lineWidth = 7
        lineShapeBorder.borderWidth = 2
        lineShapeBorder.path = path.cgPath
        lineShapeBorder.strokeStart = 1
        
        
        let myEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        myEndAnimation.fromValue = 0
        myEndAnimation.toValue = 1
        
        let myStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        myStartAnimation.fromValue = 0
        myStartAnimation.toValue = 0.1
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [myStartAnimation, myEndAnimation]
        animationGroup.duration = animateDuration
        
        
        
        lineShapeBorder.add(animationGroup, forKey: "drawLine")
        view.layer.addSublayer(lineShapeBorder)
        shapeLayer.add(animationGroup, forKey: "drawLine")
        view.layer.addSublayer(shapeLayer)
    }
}
