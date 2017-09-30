//
//  ViewController.swift
//  CALayer
//
//  Created by Alexander Baran on 30/09/2017.
//  Copyright © 2017 Alexander Baran. All rights reserved.
//

import UIKit

// https://www.raywenderlich.com/169004/calayer-tutorial-ios-getting-started

class ViewController: UIViewController {

    lazy var viewForLayer: UIView = {
        let view = UIView()
//        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
//        view.addGestureRecognizer(UIPinchGestureRecognizer(target: self, action: #selector(handlePinch)))
        return view
    }()
//
//    @objc func handleTap(sender: UITapGestureRecognizer) {
//        layer.shadowOpacity = layer.shadowOpacity == 0.7 ? 0.0 : 0.7
//    }
//
//    @objc func handlePinch(sender: UIPinchGestureRecognizer) {
//        let offset: CGFloat = sender.scale < 1 ? 5.0 : -5.0
//        let oldFrame = layer.frame
//        let oldOrigin = oldFrame.origin
//        let newOrigin = CGPoint(x: oldOrigin.x + offset, y: oldOrigin.y + offset)
//        let newSize = CGSize(width: oldFrame.width + (offset * -2.0), height: oldFrame.height + (offset * -2.0))
//        let newFrame = CGRect(origin: newOrigin, size: newSize)
//        if newFrame.width >= 100.0 && newFrame.width <= 300.0 {
//            layer.borderWidth -= offset
//            layer.cornerRadius += (offset / 2.0)
//            layer.frame = newFrame
//        }
//    }
    
//    var layer: CALayer {
//        return viewForLayer.layer
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(viewForLayer)
        viewForLayer.anchor(top: nil, left: nil, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 200, heightConstant: 200)
        viewForLayer.anchorCenterSuperview()
//        setUpLayer()
        
        // The bounds of an UIView is the rectangle, expressed as a location (x,y) and size (width,height) relative to its own coordinate system (0,0). The frame of an UIView is the rectangle, expressed as a location (x,y) and size (width,height) relative to the superview it is contained within.
        print("viewForLayer.frame", viewForLayer.frame) // viewForLayer.frame (0.0, 0.0, 0.0, 0.0)
        print("viewForLayer.bounds", viewForLayer.bounds) // viewForLayer.bounds (0.0, 0.0, 0.0, 0.0)
        
//        viewForLayer.layoutIfNeeded()
        view.layoutIfNeeded()
        
        let layer = CALayer()
        layer.frame = viewForLayer.frame
        
        print("viewForLayer.frame", viewForLayer.frame)
        print("viewForLayer.bounds", viewForLayer.bounds)
        
        layer.contents = UIImage(named: "star")?.cgImage
        layer.contentsGravity = kCAGravityCenter
        layer.magnificationFilter = kCAFilterLinear
        layer.isGeometryFlipped = false
        layer.backgroundColor = UIColor(red: 11/255.0, green: 86/255.0, blue: 14/255.0, alpha: 1.0).cgColor
        layer.opacity = 1.0
        layer.isHidden = false
        layer.masksToBounds = false
        layer.cornerRadius = 100.0
        layer.borderWidth = 12.0
        layer.borderColor = UIColor.white.cgColor
        
        layer.shadowOpacity = 0.75
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 3.0
        
        view.layer.addSublayer(layer)
    }

//    func setUpLayer() {
//        layer.backgroundColor = UIColor.blue.cgColor
//        layer.borderWidth = 100.0
//        layer.borderColor = UIColor.red.cgColor
//        layer.shadowOpacity = 0.7
//        layer.shadowRadius = 10.0
//    }
    
}

