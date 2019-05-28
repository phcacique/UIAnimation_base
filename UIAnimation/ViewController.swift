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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        uma das animacoes (a primeira da aula)
        
//        UIView.animate(withDuration: 1.0, delay: 0, animations: {
//            self.rocket.center.y = self.view.frame.height - self.world.frame.height/2
//
//            self.rocket.transform = self.rocket.transform.rotated(by: .pi/2)
//
//            //self.rocket.transform = self.rocket.transform.scaledBy(x: 2, y: 2)
//        }, completion: {finished in
//            //self.rocket.image = UIImage(named: "rocket2.png")
//            self.outraAnimacao()
//
//        })
        
        //options: .repeat , .autoreverse, curveEaseIn (aceleracao vai e depois constante), out (a aceleracao é no fim) e o in/out é uma mistura dos dois
        //tem transform, frame e bound?
        
        
        let circlePath = UIBezierPath(arcCenter: self.world.center,
                                      radius: self.world.frame.height,
                                      startAngle: 0,
                                      endAngle: .pi * 2,
                                      clockwise: true)
        
        let animation = CAKeyframeAnimation(keyPath: #keyPath(CALayer.position))
        //esse CAKey pede para ver qual é o tipo de animacao, se é de posicao, de rotacao, etc
        
        animation.duration = 5.0
        animation.repeatCount = MAXFLOAT
        //agora vamos relacionar o caminho que tinhamos descrito com a animaçao:
        animation.path = circlePath.cgPath
        rocket.layer.add(animation, forKey: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //chamada para arrumar o conteudo antes de aparecer na tela
        // esse self indica a view
        //se eu nao colocar size eu nao consigop atribuir valor, se for so leitura nao precisa do size
        
        //tamanho e posicao do planeta
        self.world.frame.size.width = self.view.frame.width
        self.world.center.y = self.view.frame.height
        
        //tamanho e posicao do foguete
        self.rocket.frame.size.height = self.view.frame.height * 0.3
        self.rocket.center.x = self.view.center.x
        self.rocket.center.y = self.rocket.frame.height/2
    }
    
    func outraAnimacao(){
        UIView.animate(withDuration: 2.0, animations: {
                self.rocket.center.x = self.view.frame.width
            })
    
    }
}

