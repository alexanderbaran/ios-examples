//
//  MessagesInputContainerView.swift
//  InputContainerView
//
//  Created by Alexander Baran on 28/12/2017.
//  Copyright © 2017 Alexander Baran. All rights reserved.
//

import UIKit

class MessagesInputContainerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var inputTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter message..."
//        textField.font = UIFont.systemFont(ofSize: 15)
        return textField
    }()
    
    let sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Send", for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return button
    }()
    
    let separatorLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        return view
    }()
    
    private func setupViews() {
        backgroundColor = .white

        addSubview(sendButton)
        addSubview(inputTextField)
        addSubview(separatorLineView)
        
        sendButton.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 0)
        
        inputTextField.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: sendButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        separatorLineView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 1)
    }
    
}
