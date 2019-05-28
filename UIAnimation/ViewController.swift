//
//  ViewController.swift
//  UIAnimation_base
//
//  Created by Pedro Cacique on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var world: UIImageView!
    @IBOutlet weak var rocket: UIImageView!
    
   //sem a tabbar precxisa do willApear--> seta aa posicao inicial, antes de aparecer na tela e DidApear--> depois que apareceu na tela
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseOut], animations: {
//            self.rocket.center.y = self.view.frame.height - self.world.frame.height/2
//
//        },completion: { finished in
//        self.criarAnimacao()
//
//        })
//    }
//
//
//    func criarAnimacao() {
//        UIView.animate(withDuration: 2, animations: {
//            UIView.animate(withDuration: 1, animations: {
//                self.rocket.transform = self.rocket.transform.rotated(by: .pi)
//                self.rocket.image = UIImage(named: "rocket2.png")
//        })
//
//    }
//    )}
    
        //cria o caminho
        let circlePath = UIBezierPath(arcCenter: self.world.center,
                                      radius: self.world.frame.height,
                                      startAngle: 0,
                                      endAngle: .pi*2,
                                      clockwise: true)
    //cria a animacao
        let animation = CAKeyframeAnimation(keyPath: #keyPath(CALayer.position))
        animation.duration = 1
        animation.repeatCount = MAXFLOAT
        animation.path = circlePath.cgPath
        
        
        //conectar o rocket com a animacao
        rocket.layer.add(animation,forKey: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.world.frame.size.width =  self.view.frame.width    //TAMANHO ANTES DA POSICAO, size.widht atribui valor
        self.world.center.y = self.view.frame.height
        
        self.rocket.frame.size.height = self.view.frame.height*0.15
        self.rocket.center.x = self.view.center.x
        self.rocket.center.y = self.rocket.frame.height
    }


}

