//
//  ActiveMessagesController.swift
//  InputContainerView
//
//  Created by Alexander Baran on 28/12/2017.
//  Copyright © 2017 Alexander Baran. All rights reserved.
//

import UIKit

class ActiveMessagesController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let activeMessagesCellId = "activeMessagesCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Active Messages"
        
        collectionView?.backgroundColor = .white
        
        collectionView?.alwaysBounceVertical = true
        
        collectionView?.register(ActiveMessagesCell.self, forCellWithReuseIdentifier: activeMessagesCellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: activeMessagesCellId, for: indexPath) as! ActiveMessagesCell
        cell.messageLabel.text = "Cell nr \(indexPath.item)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let messagesFlowLayout = UICollectionViewFlowLayout()
        let messagesController = MessagesController(collectionViewLayout: messagesFlowLayout)
        navigationController?.pushViewController(messagesController, animated: true)
    }
}

