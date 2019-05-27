//
//  PrataVC.swift
//  UIAnimation
//
//  Created by Artur Carneiro on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class PrataVC: UIViewController {

    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var world: UIImageView!
    @IBOutlet weak var gameTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewWillAppear(_ animated: Bool) {
        self.world.center.y = self.view.frame.height
        self.world.center.x = self.view.center.x
        self.world.frame.size.width = self.view.frame.size.width
        
        self.rocket.center.x = self.view.center.x
        self.rocket.center.y = self.world.frame.size.height * 2 - self.world.frame.size.height/2 - self.rocket.frame.size.height/2
        self.rocket.frame.size.height = self.view.frame.size.height * 0.15
        
        self.rocket.image = UIImage(named: "rocket2")
        
        self.gameTitle.center.x -= view.bounds.width
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 2, delay: 0.0, options: [.curveEaseInOut], animations: {
            self.rocket.center.y -= 300
            self.rocket.image = UIImage(named: "rocket")
        }) { (finished) in
            self.rocket.image = UIImage(named: "rocket2")
        }
    }
    


}
