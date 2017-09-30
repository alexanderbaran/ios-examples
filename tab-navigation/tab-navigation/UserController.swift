//
//  UserController.swift
//  tab-navigation
//
//  Created by Alexander Baran on 29/09/2017.
//  Copyright © 2017 Alexander Baran. All rights reserved.
//

import UIKit
import FontAwesome

class UserController: UIViewController {
    
    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Back", for: .normal)
        button.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        return button
    }()
    
    @objc func handleBack() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "User"
        
        view.backgroundColor = .white
        
        view.addSubview(backButton)
        backButton.anchorCenterSuperview()
    }
    
}
