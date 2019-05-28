//
//  ViewControllerBronze.swift
//  UIAnimation
//
//  Created by Eloisa Falcão on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerBronze: UIViewController {
   
    @IBOutlet var fundo: UIView!
    
    @IBOutlet weak var segmentedControllOutlet: UISegmentedControl!
    
    @IBAction func SegmentedControllAction(_ sender: Any) {
        
        switch segmentedControllOutlet.selectedSegmentIndex {
        case 0:
            fundo.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        default:
            fundo.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        }
        
    }
    

    @IBOutlet weak var foguete: UIImageView!
    
    @IBOutlet weak var planeta: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {

        self.foguete.frame.size.height = self.view.frame.height*0.15
        self.foguete.center.x = self.view.center.x
        self.foguete.center.y = self.view.frame.height/2 + self.planeta.frame.height/2
       

        //Constroi uma linha
        let myPath = UIBezierPath()
        myPath.move(to: CGPoint(x: self.foguete.center.x, y: self.view.frame.height - self.planeta.frame.height/4))
        myPath.addLine(to: CGPoint(x: self.view.frame.width/2, y: self.foguete.frame.height/1.25))


        //renderiza a linha na view
        let myShapeLayer = CAShapeLayer()
        myShapeLayer.strokeColor = #colorLiteral(red: 1, green: 0.5255957842, blue: 0.222887367, alpha: 1)
        myShapeLayer.lineWidth = 10
        myShapeLayer.strokeStart = 0.8
        myShapeLayer.path = myPath.cgPath
        myShapeLayer.zPosition = -1
        view.layer.addSublayer(myShapeLayer)

        let myAnimation = CABasicAnimation(keyPath: "strokeEnd")
        myAnimation.fromValue = 0
        myAnimation.toValue = 1
        myAnimation.duration = 2.0

        myShapeLayer.add(myAnimation, forKey: "drawLine")

        //cria a animacao da linha
        let myEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        myEndAnimation.fromValue = 0.2
        myEndAnimation.toValue = 1.0

        //apaga animacao da linha
        let myStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        myStartAnimation.fromValue = 0.0
        myStartAnimation.toValue = 0.8

        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [myStartAnimation, myEndAnimation]
        animationGroup.duration = 2

        myShapeLayer.add(animationGroup, forKey: "drawLine")
        view.layer.addSublayer(myShapeLayer)
        
        UIView.animate(withDuration: 2.0, delay: 0, options: [.curveLinear], animations: {
            
            self.foguete.center.y = self.foguete.frame.height/1.25}, completion: { finished in
                myShapeLayer.removeFromSuperlayer()
        } )
                
    }
    
    
     override func viewWillAppear(_ animated: Bool) {
           
            self.planeta.frame.size.width = self.view.frame.width
            self.planeta.center.y = self.view.frame.height
          
            self.foguete.frame.size.height = self.view.frame.height*0.15
            self.foguete.center.x = self.view.center.x
            self.foguete.center.y = self.view.frame.height - self.planeta.frame.height/1.7
            

            
                
        }
        
                
             
        }
    

