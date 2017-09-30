//
//  MessagesController.swift
//  tab-navigation
//
//  Created by Alexander Baran on 29/09/2017.
//  Copyright © 2017 Alexander Baran. All rights reserved.
//

import UIKit
import FontAwesome

class MessagesController: UIViewController {
    
    let pageLabel: UILabel = {
        let label = UILabel()
        label.text = "Messages"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(pageLabel)
        pageLabel.anchorCenterSuperview()
    }
    
}


