//
//  ViewController.swift
//  GroupedMessages
//
//  Created by Nikita Kuprik on 7/7/19.
//  Copyright © 2019 Nikita Kuprik. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    fileprivate let cellId = "id"
    
    let textMessages = [
        "Here's my very first message",
        "I'm going to message another long message that will word wrap",
        "A beautiful activity indicator and modal alert written in Swift (originally developed for my app DoodleDoodle) Using blur effects, translucency, flat and bold design - all iOS 8 latest and greatest"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textMessages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatMessageCell
        cell.messageLabel.text = textMessages[indexPath.row]
        return cell
    }

}

