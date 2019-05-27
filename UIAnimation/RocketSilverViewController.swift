//
//  RocketSilverViewController.swift
//  UIAnimation
//
//  Created by Edgar Sgroi on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import Foundation
import UIKit

class RocketSilverViewController: UIViewController {
    
   
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var world: UIImageView!
    @IBOutlet weak var fldLogin: UITextField!
    @IBOutlet weak var fldPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func Login(_ sender: Any) {
        self.rocketRelease()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 3.0, delay: 0, options: [.curveEaseOut], animations: {
            self.rocket.center.y = self.world.center.y - self.rocket.frame.size.width * 2
        }, completion: { finished in
            self.rocket.image = UIImage(named: "rocket2.png")
            self.showLogin()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.rocket.center.x = self.view.center.x
        self.fldLogin.center.x = self.view.frame.size.width - self.view.frame.size.width * 2
        self.fldLogin.center.y = self.view.center.y - self.fldLogin.frame.size.height
        self.fldPassword.center.x = self.view.frame.size.width - self.view.frame.size.width * 2
        self.fldPassword.center.y = self.view.center.y + self.fldPassword.frame.size.height
        
        self.world.frame.size.width = self.view.frame.size.width
        self.world.center.x = self.view.center.x
        self.world.center.y = self.view.frame.height
    }

    func showLogin(){
        UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseOut], animations: {
            self.fldLogin.center.x = self.view.center.x
            self.fldLogin.center.y = self.view.center.y - self.fldLogin.frame.size.height
            
        }, completion: { finished in
            UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseOut], animations: {
                self.fldPassword.center.x = self.view.center.x
                self.fldPassword.center.y = self.view.center.y + self.fldPassword.frame.size.height
            }, completion: { finished in
                self.showLoginButton()
            })
        })
    }
    
    func hideLogin(){
        UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseOut], animations: {
            self.fldLogin.alpha = 0
            self.fldPassword.alpha = 0
            self.btnLogin.alpha = 0
        }, completion: { finished in
            self.changeSegue()
        })
    }
    
    func changeSegue(){
        UIView.animate(withDuration: 3.0, delay: 0, options: [.curveEaseInOut], animations: {
            self.world.center.x = self.rocket.center.x
            self.world.center.y = self.rocket.center.y
        }, completion: { finished in
            self.performSegue(withIdentifier: "NextViewController", sender: nil)
        })
    }
    
    func showLoginButton(){
        UIView.animate(withDuration: 1.0, delay: 0, animations: {
            self.btnLogin.alpha = 1
        })
    }
    
    func rocketRelease(){
        UIView.animate(withDuration: 3.0, delay: 0, animations: {
            self.rocket.image = UIImage(named: "rocket.png")
            self.rocket.center.y = -self.view.frame.size.height
            self.hideLogin()
        })
    }
    
    
}
