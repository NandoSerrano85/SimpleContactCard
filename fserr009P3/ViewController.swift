//
//  ViewController.swift
//  fserr009P3
//
//  Created by Fernando Serrano on 9/15/19.
//  Copyright © 2019 FIU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var newButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    let db = ContactDB.instance
    override func viewDidLoad() {
        super.viewDidLoad()
        let contact:(String, String) = db.getContact(action: "first")
        nameField.text = contact.0
        emailField.text = contact.1
    }

    @IBAction func rotateContactCards(_ sender: UIButton) {
        let contact:(String, String) = db.getContact(action: sender.currentTitle!)
        nameField.text = contact.0
        emailField.text = contact.1
    }
    
    @IBAction func insertContactCard(_ sender: UIButton) {
        let contact:(String, String) = db.editContact(action: sender.currentTitle!, name:nameField.text!, email:emailField.text!)
        nameField.text = contact.0
        emailField.text = contact.1
    }
    
    
    
}

