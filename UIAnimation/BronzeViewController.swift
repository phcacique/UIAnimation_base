//
//  BronzeViewController.swift
//  UIAnimation
//
//  Created by Zewu Chen on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class BronzeViewController: UIViewController {
    
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var world: UIImageView!
    @IBOutlet weak var segmented: UISegmentedControl!
    
    //Chama uma vez pra toda tab bar
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //Assim que aparece
    override func viewDidAppear(_ animated: Bool) {
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
        })

    }
    
    //Antes que aparece
    override func viewWillAppear(_ animated: Bool) {
        //bounds - conteúdo dentro do frame
        //frame - escala e posicionamento
        //center - movimentação na tela
        
        self.rocket.center.x = self.view.center.x
        self.rocket.frame.size.height = self.view.frame.size.height * 0.30
        
        self.world.frame.size.width = self.view.frame.size.width
        self.world.center.x = self.view.center.x
        self.world.center.y = self.view.frame.height
        
    }

    @IBAction func changedSegmented(_ sender: UISegmentedControl) {
        if segmented.selectedSegmentIndex == 0{
            self.view.backgroundColor = #colorLiteral(red: 0.2784313725, green: 0.3568627451, blue: 0.4352941176, alpha: 1)
        }else if segmented.selectedSegmentIndex == 1{
            self.view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        }
    }
}
