//
//  ViewController.swift
//  UIScrollView
//
//  Created by Alexander Baran on 05/10/2017.
//  Copyright © 2017 Alexander Baran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .gray
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        let view1 = UIView()
        view1.backgroundColor = .red
        
        let view2 = UIView()
        view2.backgroundColor = .blue
        
        let view3 = UIView()
        view3.backgroundColor = .green
        
        let view4 = UIView()
        view4.backgroundColor = .purple
        
        let views = [view1, view2, view3, view4]
        
        for view in views {
            scrollView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        view1.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        view1.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        view1.heightAnchor.constraint(equalToConstant: 140).isActive = true
        view1.widthAnchor.constraint(equalToConstant: 140).isActive = true
        
        view2.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 100).isActive = true
        view2.leftAnchor.constraint(equalTo: view1.rightAnchor).isActive = true
        view2.heightAnchor.constraint(equalToConstant: 140).isActive = true
        view2.widthAnchor.constraint(equalToConstant: 140).isActive = true
        
        view3.topAnchor.constraint(equalTo: view2.bottomAnchor, constant: 50).isActive = true
        view3.leftAnchor.constraint(equalTo: view1.rightAnchor).isActive = true
        view3.heightAnchor.constraint(equalToConstant: 140).isActive = true
        view3.widthAnchor.constraint(equalToConstant: 140).isActive = true
        
        view4.topAnchor.constraint(equalTo: view3.bottomAnchor, constant: 20).isActive = true
        view4.leftAnchor.constraint(equalTo: view1.rightAnchor).isActive = true
        view4.heightAnchor.constraint(equalToConstant: 140).isActive = true
        view4.widthAnchor.constraint(equalToConstant: 140).isActive = true
        
        // Must set a bottomAnchor as well as topAnchor. If you want it to scroll sideways need to set left and right anchors.
        // When using Autolayout in UIScrollViews you have to pin subviews both to the top and bottom of the scrollview which allows the scrollview to calculate its contentSize.
        // https://stackoverflow.com/questions/46593585/programatically-layed-out-uiscrollview-and-added-auto-layout-to-its-subviews/46593649#46593649
        view4.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
}


















