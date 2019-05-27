//
//  BronzeViewController.swift
//  UIAnimation
//
//  Created by Rafael Galdino on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class BronzeViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var imgRocket: UIImageView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var trailPath : UIBezierPath = UIBezierPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trailPath = UIBezierPath()
        self.imgRocket.center = CGPoint(x: self.view.frame.width/2,
                                        y: self.view.frame.height - self.imgRocket.frame.height/2 - (self.tabBarController?.tabBar.frame.height ?? 0))
        
        trailPath.move(to: CGPoint(x: self.imgRocket.center.x,
                                    y: self.imgRocket.center.y + self.imgRocket.frame.height/2))
        trailPath.addLine(to: CGPoint(x: self.view.frame.width/2,
                                       y: CGFloat.zero - self.imgRocket.frame.height/2))
    }
    override func viewDidAppear(_ animated: Bool) {
        viewDidLoad()
        
        let slTrail = CAShapeLayer()
        
        slTrail.strokeColor = UIColor.gray.cgColor
        slTrail.lineWidth = 5
        slTrail.path = trailPath.cgPath
        slTrail.strokeStart = 1
        slTrail.lineCap = .round
        
        let lineDraw = CABasicAnimation(keyPath: "strokeEnd")
        lineDraw.fromValue = 0
        lineDraw.toValue = 1

        let lineEraser = CABasicAnimation(keyPath: "strokeStart")
        lineEraser.fromValue = 0.0
        lineEraser.toValue = 0.9
        lineEraser.beginTime = 0.1

        let trailAnimGrp = CAAnimationGroup()
        trailAnimGrp.animations = [lineDraw, lineEraser]
        trailAnimGrp.duration = 2.0

        slTrail.add(trailAnimGrp, forKey: "drawLine")
        self.view.layer.addSublayer(slTrail)
        
        UIView.animate(withDuration: 2.0, delay: 0.0, options: [.curveLinear], animations: {
            self.imgRocket.center = CGPoint(x: self.view.frame.width/2,
                                           y: CGFloat.zero - self.imgRocket.frame.height)
        }) { (finished) in
            slTrail.removeFromSuperlayer()
        }
    }
    
    @IBAction func changedBackground(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            self.view.backgroundColor = UIColor(red: 52/255,
                                                green: 73/255,
                                                blue: 94/255,
                                                alpha: 1.0)
            segmentedControl.tintColor = UIColor(white: 1, alpha: 1)
        default:
            self.view.backgroundColor = UIColor(white: 0.9, alpha: 1)
            segmentedControl.tintColor = UIColor(red: 52/255,
                                                 green: 73/255,
                                                 blue: 94/255,
                                                 alpha: 1.0)
        }
    }
    
    
}
