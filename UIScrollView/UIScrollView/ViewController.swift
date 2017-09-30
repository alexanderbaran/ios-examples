//
//  ViewController.swift
//  UIScrollView
//
//  Created by Alexander Baran on 30/09/2017.
//  Copyright © 2017 Alexander Baran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/WorkingwithScrollViews.html
    // https://stackoverflow.com/questions/31668970/is-it-possible-for-uistackview-to-scroll
    // https://gist.github.com/twostraws/a02d4cc09fc7bc16859c
    
    /* Comment: It is not necessary to override viewDidLayoutSubviews() here. Just change line 33 to also attach to the bottom of the scrollView with this visualFormatString: "V:|[stackView]|" (Notice the added '|' at the end of the string)
     
     After making this change everything works as expected and you don't have to set the contentSize manually. */
    
    var scrollView: UIScrollView!
    var stackView: UIStackView!
    
    var scrollViewBottomConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .green
        view.addSubview(scrollView)
        
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[scrollView]|", options: .alignAllCenterX, metrics: nil, views: ["scrollView": scrollView]))
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[scrollView]|", options: .alignAllCenterX, metrics: nil, views: ["scrollView": scrollView]))
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[scrollView]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["scrollView": scrollView]))
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[scrollView]-200-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["scrollView": scrollView]))
        
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        scrollViewBottomConstraint = scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        scrollViewBottomConstraint?.isActive = true
        // https://stackoverflow.com/questions/32981532/difference-between-leftanchor-and-leadinganchor
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        scrollView.addSubview(stackView)
        
//        scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[stackView]|", options: NSLayoutFormatOptions.alignAllCenterX, metrics: nil, views: ["stackView": stackView]))
//        scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[stackView]|", options: NSLayoutFormatOptions.alignAllCenterX, metrics: nil, views: ["stackView": stackView]))
//        scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[stackView]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["stackView": stackView]))
//        scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[stackView]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["stackView": stackView]))
        
        // Pin the edges of the stack view to the edges of the scroll view that contains it
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        
        // Set the width of the stack view to the width of the scroll view for vertical scrolling
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        for _ in 1 ..< 10 {
            let vw = UIButton(type: UIButtonType.system)
            vw.setTitle("Button", for: .normal)
            stackView.addArrangedSubview(vw)
        }
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { (timer) in
            self.scrollViewBottomConstraint?.constant = -200
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        scrollView.contentSize = CGSize(width: stackView.frame.width, height: stackView.frame.height)
//    }

}

