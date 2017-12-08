//
//  WelcomeViewController.swift
//  GitPatch
//
//  Created by Rolland Cédric on 06.12.17.
//  Copyright © 2017 Rolland Cédric. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var startButton: UIButton!
    @IBOutlet var swipeGestureRecognizer: UISwipeGestureRecognizer!
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.addTarget(self, action: #selector(start(_:)), for: .touchUpInside)
        swipeGestureRecognizer.addTarget(self, action: #selector(start(_:)))
        swipeGestureRecognizer.direction = .up
        welcomeLabel.alpha = 0
        messageLabel.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1, animations: {() -> Void in
            self.welcomeLabel.alpha = 1
            self.messageLabel.alpha = 1
        })
    }
    
    @objc func start(_ sender: UIButton) {
        if let nc = storyboard?.instantiateViewController(withIdentifier: NavigationController.identifier) as? NavigationController {
            present(nc, animated: true, completion: nil)
        }
    }
}
