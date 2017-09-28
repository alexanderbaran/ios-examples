//
//  ViewController.swift
//  MBProgressHUD-test
//
//  Created by Alexander Baran on 28/09/2017.
//  Copyright © 2017 Alexander Baran. All rights reserved.
//

import UIKit
import MBProgressHUD

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
//            // Do something...
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [MBProgressHUD hideHUDForView:self.view animated:YES];
//                });
//            });
        
        MBProgressHUD.showAdded(to: view, animated: true)
        // https://stackoverflow.com/questions/37805885/how-to-create-dispatch-queue-in-swift-3
        DispatchQueue.global(qos: .background).async { [weak self] () -> Void in
            guard let strongSelf = self else { return }
            sleep(2) // Do something...
            DispatchQueue.main.async { () -> Void in
                MBProgressHUD.hide(for: strongSelf.view, animated: true)
            }
        }
        
        
        
    }
    
}

