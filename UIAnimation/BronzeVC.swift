//
//  BronzeVC.swift
//  UIAnimation
//
//  Created by Pedro Henrique Guedes Silveira on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class BronzeVC: UIViewController {

    @IBOutlet weak var worldImg: UIImageView!
    @IBOutlet weak var rocketImg: UIImageView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
    
        self.rocketImg.center.x = self.view.center.x
        self.rocketImg.frame.size.height = self.view.frame.size.height * 0.1
        self.rocketImg.center.y = self.worldImg.frame.height * 1.5 - self.rocketImg.frame.size.height/2
        
        self.worldImg.frame.size.width = self.view.frame.size.width
        self.worldImg.center.x = self.view.center.x
        self.worldImg.center.y = self.view.frame.size.height
        view.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)


        
        
    
    
            
            
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 2, delay: 0.0, options: [], animations: { self.rocketImg.center.y -= 300
            self.rocketImg.image = UIImage(named: "rocket")
        }) { (finished) in
            self.rocketImg.image = UIImage(named: "rocket2")
        }
        
        
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.rocketImg.center.x, y: self.worldImg.frame.height * 1.5 - self.rocketImg.frame.size.height/2 + self.rocketImg.frame.size.height/2))
        path.addLine(to: CGPoint(x: self.rocketImg.center.x, y: self.rocketImg.center.y + self.rocketImg.frame.size.height/2))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 6
        
        shapeLayer.path = path.cgPath
        view.layer.addSublayer(shapeLayer)
        
        let myAnimation = CABasicAnimation(keyPath: "strokeEnd")
        myAnimation.fromValue = 0
        myAnimation.toValue = 1
        myAnimation.duration = 2
        
        shapeLayer.add(myAnimation, forKey: "drawLine")
        
        
        
    }
    

    @IBAction func colorSegmentedControl(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0) {
            view.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        }else{
            view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
