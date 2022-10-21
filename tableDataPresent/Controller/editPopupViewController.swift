//
//  editPopupViewController.swift
//  tableDataPresent
//
//  Created by Navaneethkrishnan Manoj on 12/10/22.
//

import UIKit

let notificationCenter = NotificationCenter.default

class editPopupViewController: UIViewController {
    // Notification Name set
    let notificationName = Notification.Name("Notification#1")
    
    // outlet connected
    @IBOutlet weak var editBox: UITextView!
    
    // varibles set
    var presentText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // editbox borders curved
        editBox.layer.cornerRadius = 5
        editBox.layer.masksToBounds = true
        
        editBox.text = presentText
        
    }
    @IBAction func submitBtn(_ sender: Any) {
        // updates the text data with edits made
        let myMessage:[String: String] = ["new_edit_text": self.editBox.text]
        notificationCenter.post(name: notificationName, object: nil, userInfo: myMessage)
        dismiss(animated: true, completion: nil)
    }
}
    

