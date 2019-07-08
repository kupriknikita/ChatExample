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
    
    let messageFromServer = [
        ChatMessage(text: "Here's my first message", isIncoming: true, date: Date.dateFromCustomString(customString: "07/07/2019")),
        ChatMessage(text: "HEEEY?", isIncoming: true, date: Date.dateFromCustomString(customString: "07/07/2019")),
        ChatMessage(text: "ASDASDASD", isIncoming: true, date: Date.dateFromCustomString(customString: "07/07/2019")),
        ChatMessage(text: "Where are you???", isIncoming: true, date: Date.dateFromCustomString(customString: "07/07/2019")),
        ChatMessage(text: "Check it now!", isIncoming: true, date: Date.dateFromCustomString(customString: "07/07/2019")),
        ChatMessage(text: "Wow, dude, congratulations!", isIncoming: false, date: Date.dateFromCustomString(customString: "07/08/2019")),
        ChatMessage(text: "Amazing! Amazing! Amazing! Amazing! Amazing! Amazing! Amazing! Amazing! Amazing! Amazing! Amazing! Amazing!", isIncoming: false, date: Date.dateFromCustomString(customString: "07/08/2019")),
        ChatMessage(text: "Thank you!", isIncoming: true, date: Date.dateFromCustomString(customString: "07/08/2019")),
        ChatMessage(text: "A black hole is a region of spacetime exhibiting gravitational acceleration so strong that nothing—no particles or even electromagnetic radiation such as light—can escape from it.", isIncoming: true, date: Date.dateFromCustomString(customString: "01/01/1970")),
        ChatMessage(text: "A black hole is a region of spacetime exhibiting gravitational acceleration so strong that nothing—no particles or even electromagnetic radiation such as light—can escape from it.", isIncoming: true, date: Date.dateFromCustomString(customString: "01/01/2020"))
    ]
    
    fileprivate func attemptToAssemblyGroupedMessages() {
        let groupedMessages = Dictionary(grouping: messageFromServer) { (element) -> Date in
            return element.date
        }
        
        let sortedKeys = groupedMessages.keys.sorted()
        sortedKeys.forEach { (key) in
            let values = groupedMessages[key]
            chatMessages.append(values ?? [])
        }
    }

    var chatMessages = [[ChatMessage]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        attemptToAssemblyGroupedMessages()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
    }
    
    class DateHeaderLabel: UILabel {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            backgroundColor = #colorLiteral(red: 0.1703272259, green: 0.7313015546, blue: 0.3687796461, alpha: 1)
            textColor = .white
            textAlignment = .center
            translatesAutoresizingMaskIntoConstraints = false
            font = UIFont.boldSystemFont(ofSize: 14)
            
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override var intrinsicContentSize: CGSize {
            let originalContentSize = super.intrinsicContentSize
            let height = originalContentSize.height + 12
            layer.cornerRadius = height / 2
            layer.masksToBounds = true
            return CGSize(width: originalContentSize.width + 20, height: height)
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let firstMessageInSection = chatMessages[section].first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let dateString = dateFormatter.string(from: firstMessageInSection.date)
            
            let label = DateHeaderLabel()
            label.text = dateString
            
            let containerView = UIView()
            containerView.addSubview(label)
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
            
            return containerView
        }
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
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

