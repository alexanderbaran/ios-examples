//
//  MessagesController.swift
//  InputContainerView
//
//  Created by Alexander Baran on 28/12/2017.
//  Copyright © 2017 Alexander Baran. All rights reserved.
//

import UIKit

class MessagesController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        
        collectionView?.backgroundColor = .white
        
        collectionView?.alwaysBounceVertical = true
        // This prevents flickering of placeholder text and button on inputAccessoryView on simulator for some weird reason, but we also needs to scroll to bottom after loading messages because it does not do so automatically when setting top edge inset.
        collectionView?.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        collectionView?.keyboardDismissMode = .interactive
    }
    
    lazy var inputContainerView: MessagesInputContainerView = {
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
        let messagesInputContainerView = MessagesInputContainerView(frame: frame)
        return messagesInputContainerView
    }()

//    lazy var inputContainerView: ChatInputContainerView = {
//        let frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
//        let chatInputContainerView = ChatInputContainerView(frame: frame)
//        return chatInputContainerView
//    }()
    
    override var inputAccessoryView: UIView? {
        return inputContainerView
    }

    override var canBecomeFirstResponder: Bool {
        return true
    }

}

