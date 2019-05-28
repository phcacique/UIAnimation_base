//
//  File.swift
//  UIAnimation
//
//  Created by Eloisa Falcão on 28/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerPrata: UIViewController {
    
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var senha: UITextField!
    @IBOutlet weak var foguete: UIImageView!
    @IBOutlet weak var lua: UIImageView!
    
    @IBAction func enviar(_ sender: Any) {
       
        UIView.animate(withDuration: 2, animations: {
           
            self.titulo.center.x = self.view.center.x + 800
            
            self.login.center.x = self.view.center.x + 800
            
            self.senha.center.x = self.view.center.x + 800
            
            self.enviar.center.x = self.view.center.x + 800
            
            self.foguete.center.x = self.view.center.x
            self.foguete.center.y = self.view.center.x - 900
            
            
        }, completion: { finished in
            
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: "TelaDeBack") as UIViewController
            self.present(vc, animated: true, completion: nil)
            
        }
        
        
        )
        
    }
    
    @IBOutlet weak var enviar: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
     
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseOut], animations: {
            
            self.titulo.center.x = self.view.center.x
            
            self.login.center.x = self.view.center.x
            
            self.senha.center.x = self.view.center.x
            
            self.enviar.center.x = self.view.center.x
            
            
        })

        
    }

    override func viewWillAppear(_ animated: Bool) {
    
    self.titulo.center.x = self.view.center.x - 200
        
    self.login.center.x = self.view.center.x - 200
    
    self.senha.center.x = self.view.center.x - 200
   
    self.enviar.center.x = self.view.center.x - 200
 
    self.foguete.center.x = self.view.center.x
       
    self.lua.center.x = self.view.center.x
    
    
}

}
