//
//  ViewController.swift
//  UINavigationController
//
//  Created by Alexander Baran on 24/09/2017.
//  Copyright © 2017 Alexander Baran. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {

    lazy var transitionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("To Blue", for: .normal)
        button.addTarget(self, action: #selector(handleToBlue), for: .touchUpInside)
        return button
    }()
    
    // https://stackoverflow.com/questions/36818083/selector-refers-to-a-method-that-is-not-exposed-to-objective-c
    @objc func handleToBlue() {
        let blueViewController = BlueViewController()
        navigationController?.pushViewController(blueViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        view.addSubview(transitionButton)
        transitionButton.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        transitionButton.center = view.center
    }

}

