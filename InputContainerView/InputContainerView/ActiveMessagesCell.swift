//
//  ActiveMessagesCell.swift
//  InputContainerView
//
//  Created by Alexander Baran on 28/12/2017.
//  Copyright © 2017 Alexander Baran. All rights reserved.
//

import UIKit

class ActiveMessagesCell: BaseCell {
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()

    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .red
        
        addSubview(messageLabel)
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        messageLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
}
