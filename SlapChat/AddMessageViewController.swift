//
//  AddMessageViewController.swift
//  SlapChat
//
//  Created by Ryan Cohen on 7/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class AddMessageViewController: UIViewController {

    var dataStore = DataStore()
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func save() {
        if (textField.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) != "") {
            let message: Message = NSEntityDescription.insertNewObjectForEntityForName("Message", inManagedObjectContext: dataStore.managedObjectContext) as! Message
            
            message.content = textField.text
            message.createdAt = NSDate()
            
            dataStore.saveContext()
            self.dismissViewControllerAnimated(true, completion:nil)
        }
    }
    
    @IBAction func cancel() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
