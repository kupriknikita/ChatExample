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
    let date: Date
}

extension Date {
    static func dateFromCustomString(customString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.date(from: customString) ?? Date()
    }
}

class ViewController: UITableViewController {

    fileprivate let cellId = "id"
    
    let chatMessages = [
        [
            ChatMessage(text: "Here's my first message", isIncoming: true, date: Date.dateFromCustomString(customString: "07/07/2019")),
            ChatMessage(text: "HEEEY?", isIncoming: true, date: Date.dateFromCustomString(customString: "07/07/2019")),
            ChatMessage(text: "ASDASDASD", isIncoming: true, date: Date.dateFromCustomString(customString: "07/07/2019")),
            ChatMessage(text: "Where are you???", isIncoming: true, date: Date.dateFromCustomString(customString: "07/07/2019")),
            ChatMessage(text: "Check it now!", isIncoming: true, date: Date.dateFromCustomString(customString: "07/07/2019"))
        ],
        [
            ChatMessage(text: "Wow, dude, congratulations!", isIncoming: false, date: Date.dateFromCustomString(customString: "07/08/2019")),
            ChatMessage(text: "Amazing! Amazing! Amazing! Amazing! Amazing! Amazing! Amazing! Amazing! Amazing! Amazing! Amazing! Amazing!", isIncoming: false, date: Date.dateFromCustomString(customString: "07/08/2019")),
            ChatMessage(text: "Thank you!", isIncoming: true, date: Date.dateFromCustomString(customString: "07/08/2019"))
        ],
        [
            ChatMessage(text: "A black hole is a region of spacetime exhibiting gravitational acceleration so strong that nothing—no particles or even electromagnetic radiation such as light—can escape from it.", isIncoming: true, date: Date.dateFromCustomString(customString: "01/01/1970"))
        ]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let firstMessageInSection = chatMessages[section].first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let dateString = dateFormatter.string(from: firstMessageInSection.date)
            
            return dateString
        }
        return "Section: \(Date())"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatMessageCell
        let chatMessage = chatMessages[indexPath.section][indexPath.row]
        cell.chatMessage = chatMessage

        return cell
    }

}

