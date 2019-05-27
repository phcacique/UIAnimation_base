//
//  OuroViewController.swift
//  UIAnimation
//
//  Created by Felipe Kaça Petersen on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import Foundation
import UIKit

class OuroViewController: UIViewController {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var top: NSLayoutConstraint!
    @IBOutlet weak var left: NSLayoutConstraint!
    @IBOutlet weak var bot: NSLayoutConstraint!
    @IBOutlet weak var right: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGestures()
    }
    
    func tapGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        self.cardView.addGestureRecognizer(tap)
    }
    
    @objc func didTapView() {

        UIView.animate(withDuration: 1.5, animations: {
            self.top.constant = 0
            self.view.layoutIfNeeded()

        }) { (complete) in
            self.left.constant = 0
            self.right.constant = 0
            self.bot.constant = 0
            self.view.layoutIfNeeded()

        }
        
    }
}
