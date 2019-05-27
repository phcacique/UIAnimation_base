//
//  SilverViewController.swift
//  UIAnimation
//
//  Created by Rafael Galdino on 27/05/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import UIKit

class SilverViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var imgRocket: UIImageView!
    @IBOutlet weak var imgMoon: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnLogin.layer.cornerRadius = 5
        
        lblTitle.center = CGPoint(x: CGFloat.zero - lblTitle.frame.width,
                                  y: self.view.frame.height/6)
        
        txtName.center = CGPoint(x: CGFloat.zero - lblTitle.frame.width,
                                 y: 2 * self.view.frame.height/6)
        
        txtPassword.center = CGPoint(x: CGFloat.zero - lblTitle.frame.width,
                                     y: txtName.frame.midY + txtPassword.frame.height + 20)
        
        btnLogin.center = CGPoint(x: CGFloat.zero - lblTitle.frame.width,
                                  y: 3 * self.view.frame.height/6)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        viewDidLoad()
        
        UIView.animate(withDuration: 1.5, delay: 0.0, options: [.curveEaseOut], animations: {
            self.lblTitle.center = CGPoint(x: self.view.frame.width/2,
                                      y: self.view.frame.height/6)
            
            self.txtName.center = CGPoint(x: self.view.frame.width/2,
                                     y: 2 * self.view.frame.height/6)
            
            self.txtPassword.center = CGPoint(x: self.view.frame.width/2,
                                              y: self.txtName.frame.midY + self.txtPassword.frame.height + 20)
            
            self.btnLogin.center = CGPoint(x: self.view.frame.width/2,
                                      y: 3 * self.view.frame.height/6)
        })
    }
    
    
    @IBAction func btnPress(_ sender: Any) {
        
        self.imgRocket.image = UIImage(named: "rocket")
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [], animations: {
            self.imgRocket.center = CGPoint(x: self.view.frame.width/2,
                                            y: CGFloat.zero - self.imgRocket.frame.height)
            self.imgMoon.center = CGPoint(x: self.view.frame.width/2,
                                            y: self.view.frame.height +  self.imgMoon.frame.height)
        }) { (finished) in
            self.performSegue(withIdentifier: "silverSegue", sender: self.btnLogin)
        }
        
    }
    
    
}
