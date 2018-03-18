//
//  ChatInputContainerView.swift
//  InputContainerView
//
//  Created by Alexander Baran on 28/12/2017.
//  Copyright © 2017 Alexander Baran. All rights reserved.
//

import UIKit

// Remember you can also use extension to extend your classes to refactor code.
class ChatInputContainerView: UIView {
    
    // Should almost always override this init.
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
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Send", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let uploadImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "upload_image_icon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    let separatorLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupViews() {
        
        backgroundColor = .white
        
        //        uploadImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleUploadTap)))
        
        addSubview(uploadImageView)
        uploadImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        uploadImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        // Apple recommends that buttons are of size 44, it fits for you finger.
        uploadImageView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        uploadImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        
        // Using type: .system makes the button look more interactive with flashing when you tap. If we create a button like UIButton() then it will be 100% plain.
        //        let sendButton = UIButton(type: .system)
        //        sendButton.setTitle("Send", for: .normal)
        //        sendButton.translatesAutoresizingMaskIntoConstraints = false
        //        sendButton.addTarget(self, action: #selector(handleSend), for: .touchUpInside)
        
        
        addSubview(sendButton)
        sendButton.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        sendButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        sendButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        sendButton.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        addSubview(inputTextField)
        inputTextField.leftAnchor.constraint(equalTo: uploadImageView.rightAnchor, constant: 8).isActive = true
        inputTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        inputTextField.rightAnchor.constraint(equalTo: sendButton.leftAnchor).isActive = true
        inputTextField.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        addSubview(separatorLineView)
        separatorLineView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        separatorLineView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        separatorLineView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        separatorLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}
