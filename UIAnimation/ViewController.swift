//
//  ViewController.swift
//  UIAnimation_base
//
//  Created by Pedro Cacique on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit


/*
 Exercícios
 
 Bronze:
 - Segmented animation com o rastro do foguete
 - Trocar a cor do fundo clicando em um segmented control
 
 Prata:
 - Entrar título do jogo e campos de login a partir da esquerda
 - Ao clicar no botão de login: foquete sobe e dispara uma segue para outra ViewController ao chegar no topo
 
 Ouro:
 - Card abrindo como na App Store
 
 
 */


class ViewController: UIViewController {
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var world: UIImageView!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    let myPath = UIBezierPath()
    let myShapeLayer = CAShapeLayer()
    let myEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
    let myStartAnimation = CABasicAnimation(keyPath: "strokeStart")
    let animationGroup = CAAnimationGroup()
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBAction func clickedSegmented(_ sender: Any) {
        
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            view.backgroundColor = #colorLiteral(red: 0.2631746531, green: 0.3594709039, blue: 0.4427573681, alpha: 1)
        case 1:
            view.backgroundColor = #colorLiteral(red: 0.8994790912, green: 0.6466840216, blue: 0.6792495043, alpha: 1)
        default:
            break
        }
        
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        UIView.animate(withDuration: 2, delay: 0.3, options: [.curveEaseIn], animations: {
            self.rocket.center.y = 100
        }) { (finished) in
            self.performSegue(withIdentifier: "anotherPage", sender: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginBtn.center.x -= view.bounds.width
        usernameField.center.x -= view.bounds.width
        passwordField.center.x -= view.bounds.width

    }
    
    override func viewDidAppear(_ animated: Bool) {
//        [.repeat,.autoreverse,.curveEaseIn]
        UIView.animate(withDuration: 4, delay: 0, options: [.curveLinear] , animations: {
            self.rocket.center.y = self.world.center.y - self.world.frame.size.height/2 - self.rocket.frame.size.height/2

            //self.rocket.transform = self.rocket.transform.rotated(by: CGFloat(Double.pi))
            
            
        }) { (finished) in
            self.rocket.image = UIImage(named: "rocket2")
            self.myShapeLayer.isHidden = true
            UIView.animate(withDuration: 0.5) {
                self.loginBtn.center.x += self.view.bounds.width
            }
            UIView.animate(withDuration: 0.5, delay: 0.3, options: [],
                             animations: {
                                self.usernameField.center.x += self.view.bounds.width
            }, completion: nil )
            UIView.animate(withDuration: 0.5, delay: 0.4, options: [],
                           animations: {
                            self.passwordField.center.x += self.view.bounds.width
            },
                           completion: nil
            )
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.rocket.transform.rotated(by: CGFloat.pi)
        self.world.frame.size.width = self.view.frame.size.width
        self.world.center.x = self.view.center.x
        self.world.center.y = self.view.frame.height
        
        self.rocket.center.x = self.view.center.x
        self.rocket.frame.size.height = self.view.frame.size.height * 0.1
        self.rocket.center.y = 100
        
        //  criant o path, que contém somente as coordenadas e informações do caminho
        
        
        let rocketEnd = self.world.center.y - self.world.frame.size.height/2 + rocket.frame.size.height/2
        myPath.move(to: CGPoint(x: rocket.center.x, y: 100 + rocket.frame.height/2))
        myPath.addLine(to: CGPoint(x: rocket.center.x, y: rocketEnd + rocket.frame.size.height/2))

        // criando o layer
        myShapeLayer.strokeColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        myShapeLayer.lineWidth = 3
        myShapeLayer.path = myPath.cgPath
        myShapeLayer.strokeStart = 0.8

        myEndAnimation.fromValue = 0.2
        myEndAnimation.toValue = 1.0

        myStartAnimation.fromValue = 0.0
        myStartAnimation.toValue = 0.85

        animationGroup.animations = [myStartAnimation, myEndAnimation]
        animationGroup.duration = 4

        myShapeLayer.add(animationGroup, forKey: "drawLine")
        view.layer.addSublayer(myShapeLayer)

    }

}

