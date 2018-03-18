//
//  ViewController.swift
//  UICollectionView-manually-added
//
//  Created by Alexander Baran on 30/12/2017.
//  Copyright © 2017 Alexander Baran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//        lazy var collectionView: UICollectionView = {
//            let layout = UICollectionViewLayout()
//            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//            cv.dataSource = self
//            cv.delegate = self
//            cv.backgroundColor = .red
//            cv.alwaysBounceVertical = true
//            cv.contentInset = UIEdgeInsets(top: 1, left: 0, bottom: 8, right: 0)
//            cv.keyboardDismissMode = .interactive
//            cv.register(MessagesCell.self, forCellWithReuseIdentifier: messagesCellId)
//            return cv
//        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

