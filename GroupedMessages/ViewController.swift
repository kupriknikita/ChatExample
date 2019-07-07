//
//  ViewController.swift
//  GroupedMessages
//
//  Created by Nikita Kuprik on 7/7/19.
//  Copyright © 2019 Nikita Kuprik. All rights reserved.
//

import UIKit

struct ChatMessage {
    let text: String
    let isIncoming: Bool
}

class ViewController: UITableViewController {

    fileprivate let cellId = "id"
    
    let chatMessages = [
        ChatMessage(text: "Here's my first message", isIncoming: false),
        ChatMessage(text: "Wow, dude, congratulations!", isIncoming: true),
        ChatMessage(text: "A beautiful activity indicator and modal alert written in Swift (originally developed for my app DoodleDoodle) Using blur effects, translucency, flat and bold design - all iOS 8 latest and greatest", isIncoming: true),
        ChatMessage(text: "WTF?!", isIncoming: false)
    ]
    
//    let textMessages = [
//        "Here's my very first message",
//        "I'm going to message another long message that will word wrap",
//        "A beautiful activity indicator and modal alert written in Swift (originally developed for my app DoodleDoodle) Using blur effects, translucency, flat and bold design - all iOS 8 latest and greatest",
//        "Yo, Nikita, Whaddup"
//    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatMessageCell
        let chatMessage = chatMessages[indexPath.row]
        cell.chatMessage = chatMessage

        return cell
    }

}

