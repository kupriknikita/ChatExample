//
//  ChatMessageCell.swift
//  GroupedMessages
//
//  Created by Nikita Kuprik on 7/7/19.
//  Copyright © 2019 Nikita Kuprik. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {

    let messageLabel = UILabel()
    let bubblebackgroundView = UIView()
    
    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    
    var chatMessage: ChatMessage! {
        didSet {
            bubblebackgroundView.backgroundColor = chatMessage.isIncoming ? .white : #colorLiteral(red: 0.1500483059, green: 0.6442338198, blue: 0.32487326, alpha: 1)
            messageLabel.textColor = chatMessage.isIncoming ? .black : .white
            messageLabel.text = chatMessage.text
            
            if chatMessage.isIncoming {
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false
            } else {
                leadingConstraint.isActive = false
                trailingConstraint.isActive = true
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        //bubblebackgroundView.backgroundColor = .blue
        bubblebackgroundView.layer.cornerRadius = 12
        bubblebackgroundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bubblebackgroundView)
        
        addSubview(messageLabel)
        messageLabel.text = "A beautiful activity indicator and modal alert written in Swift (originally developed for my app DoodleDoodle) Using blur effects, translucency, flat and bold design - all iOS 8 latest and greatest"
        messageLabel.numberOfLines = 0
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: Contrsraints for our label
        let constraints = [
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            
            bubblebackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -10),
            bubblebackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -10),
            bubblebackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 10),
            bubblebackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 10)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        leadingConstraint = messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)
        leadingConstraint.isActive = false
        
        trailingConstraint = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        trailingConstraint.isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
