//
//  TableViewController.swift
//  SlapChat
//
//  Created by susan lovaglio on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {

    var messages: [Message] = []
    let dataStore = DataStore()
    
    static let dateFormatter = NSDateFormatter()
    
    // MARK: Actions
    
    @IBAction func sort() {
        let sort = NSSortDescriptor(key: "createdAt", ascending: false)
        messages = (messages as NSArray).sortedArrayUsingDescriptors([sort]) as! [Message]
        
        tableView.reloadData()
    }
    
    // MARK: Table
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "CellId"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath)
        
        let message = messages[indexPath.row];
        
        if let content = message.content {
            cell.textLabel?.text = content
        }
        
        if let date = message.createdAt {
            cell.detailTextLabel?.text = "\(date)"
             cell.detailTextLabel?.text = TableViewController.dateFormatter.stringFromDate(date)
        }
        
        return cell
    }
    
    // MARK: View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         TableViewController.dateFormatter.dateFormat = "h:mm a"
    }
    
    override func viewWillAppear(animated: Bool) {
        dataStore.fetchData()
        messages = dataStore.messages
        
        tableView.reloadData()
    }
}
