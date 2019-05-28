//
//  ViewControllerBronze.swift
//  UIAnimation
//
//  Created by Juliana Vigato Pavan on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerBronze: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        case 1:
            view.backgroundColor = #colorLiteral(red: 0.05830611289, green: 0.1177065447, blue: 0.1983863711, alpha: 1)
        default:
            break
        }
    }
    
    
    @IBOutlet weak var rocketBronze: UIImageView!
    
    @IBOutlet weak var worldBronze: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 3.0, delay: 0, animations: {
            self.rocketBronze.center.y = self.rocketBronze.frame.height/2
        
//                    self.rocketBronze.transform = self.rocketBronze.transform.rotated(by: .pi/2)
        
                    //self.rocket.transform = self.rocket.transform.scaledBy(x: 2, y: 2
        }, completion: {finished in
            //self.rocketBronze.image = UIImage(named: "rocket2.png")
        })
        
        let myPath = UIBezierPath()
        myPath.move(to: CGPoint(x: self.rocketBronze.center.x, y: self.rocketBronze.center.y + self.rocketBronze.frame.height/2))
        myPath.addLine(to: CGPoint(x:self.rocketBronze.center.x, y: self.view.frame.height/2))
        
        let myShapeLayer = CAShapeLayer()
        myShapeLayer.strokeColor = #colorLiteral(red: 0.9436462522, green: 0.6081380844, blue: 0.1705994606, alpha: 1)
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
    
    override func viewWillAppear(_ animated: Bool) {
        //chamada para arrumar o conteudo antes de aparecer na tela
        // esse self indica a view
        //se eu nao colocar size eu nao consigop atribuir valor, se for so leitura nao precisa do size
        
        //tamanho e posicao do planeta
        self.worldBronze.frame.size.width = self.view.frame.width
        self.worldBronze.center.y = self.view.frame.height
        self.rocketBronze.center.y = self.view.frame.height - self.worldBronze.frame.height/2
        //tamanho e posicao do foguete
        self.rocketBronze.frame.size.height = self.view.frame.height * 0.8
        self.rocketBronze.center.x = self.view.center.x
        
    }
        
}
