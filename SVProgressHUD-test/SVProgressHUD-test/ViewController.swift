//
//  ViewController.swift
//  SVProgressHUD-test
//
//  Created by Alexander Baran on 28/09/2017.
//  Copyright © 2017 Alexander Baran. All rights reserved.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }

    // https://stackoverflow.com/questions/11254697/difference-between-viewdidload-and-viewdidappear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        SVProgressHUD.show(withStatus: "Loading")
//        SVProgressHUD.showProgress(0.5, status: "Loading")
//        SVProgressHUD.showInfo(withStatus: "This is info")
//        SVProgressHUD.showSuccess(withStatus: "Success!")
        
        SVProgressHUD.setMinimumSize(CGSize(width: 150, height: 150))
//        SVProgressHUD.setRingRadius(60)
        SVProgressHUD.setRingNoTextRadius(50)
        SVProgressHUD.setRingThickness(5)
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.dark)
//        SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.native)
        SVProgressHUD.setBorderColor(UIColor.blue)
        SVProgressHUD.setBorderWidth(5)
        SVProgressHUD.setBackgroundColor(UIColor.purple)
//        SVProgressHUD.setImageViewSize(CGSize(width: 60, height: 60))
        SVProgressHUD.setForegroundColor(.green)
        SVProgressHUD.show()
    }

}

