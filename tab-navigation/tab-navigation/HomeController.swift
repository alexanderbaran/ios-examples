//
//  HomeController.swift
//  tab-navigation
//
//  Created by Alexander Baran on 29/09/2017.
//  Copyright © 2017 Alexander Baran. All rights reserved.
//

import UIKit
import FontAwesome

class HomeController: UIViewController {
    
//    init() {
//        // https://developer.apple.com/documentation/uikit/uiviewcontroller/1621359-init
//        // https://stackoverflow.com/questions/26923003/how-do-i-make-a-custom-initializer-for-a-uiviewcontroller-subclass-in-swift
//        super.init(nibName: nil, bundle: nil)
//        // This needs to be set in init and not in viewDidLoad in order for it to be show before it is loaded.
//        tabBarItem.title = "Home"
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    let toUserButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("To User", for: .normal)
        button.addTarget(self, action: #selector(handleToUser), for: .touchUpInside)
        return button
    }()
    
    @objc func handleToUser() {
        let userController = UserController()
        navigationController?.pushViewController(userController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        
        view.backgroundColor = .white
        
        view.addSubview(toUserButton)
        toUserButton.anchorCenterSuperview()
    }
    
}


