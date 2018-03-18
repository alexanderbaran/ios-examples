//
//  ViewController.swift
//  UIStackView
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
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scrollView.addSubview(stackView)
        
        stackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        // Need this or something else that works if want to set widthAnchor to the subviews.
        // https://stackoverflow.com/questions/46593271/setting-constant-width-on-subview-of-uistackview-when-axis-is-vertical/46593365#46593365
        stackView.alignment = .center
        
        let view1 = UIView()
        view1.backgroundColor = .red
        
        let view2 = UIView()
        view2.backgroundColor = .blue
        
        let view3 = UIView()
        view3.backgroundColor = .green
        
        let view4 = UIView()
        view4.backgroundColor = .purple
        
        stackView.addArrangedSubview(view1)
        stackView.addArrangedSubview(view2)
        stackView.addArrangedSubview(view3)
        stackView.addArrangedSubview(view4)
        
        view1.heightAnchor.constraint(equalToConstant: 200).isActive = true
        view2.heightAnchor.constraint(equalToConstant: 300).isActive = true
        view3.heightAnchor.constraint(equalToConstant: 420).isActive = true
        view4.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        view1.widthAnchor.constraint(equalToConstant: 40).isActive = true
        view2.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        view3.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        view4.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
    }

}













