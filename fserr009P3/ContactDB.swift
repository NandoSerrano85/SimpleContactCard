//
//  ContactDB.swift
//  fserr009P3
//
//  Created by Fernando Serrano on 9/15/19.
//  Copyright © 2019 FIU. All rights reserved.
//

import Foundation

final class ContactDB {
    static let instance = ContactDB()
    private var contacts: [String: String] = ["David Smith":"dsmit001@fiu.edu", "Fernando Serrano": "fserr009@fiu.edu", "Alejandra Massuh": "amass004@fiu.edu"]
    private var names: [String] = ["David Smith", "Fernando Serrano", "Alejandra Massuh"]
    private var position: Int = 0
    private var max: Int = 2
    
    private init(){}
    
    private func addContact(name:String, email:String) -> Void {
        names.append(name)
        contacts[name] = email
        max += 1
        position = 0
        names.sort()
    }
    
    private func updateContact(name:String, email:String) -> Void{
        contacts[name] = email
        position = 0
    }
    
    private func nextContact() -> Void {
        if position != max {
            position += 1
        }
        else {
            position = 0
        }
    }
    
    private func previousContact() -> Void{
        if position != 0 {
            position -= 1
        }
        else {
            position = max
        }
    }
    
    func getContact(action:String) -> (String, String) {
        if action == "Next" {
            nextContact()
        } else if action == "Prev"{
            previousContact()
        } else if action == "first" {
            position = 0
            names.sort()
        } else {
            print("Error: Did not enter the proper action of next or prev for this interface")
        }
        let contact:String = names[position]
        return (contact, contacts[contact]!)
    }
    
    func editContact(action:String, name:String, email:String) -> (String, String) {
        if action == "New" {
            addContact(name:name, email:email)
        } else if action == "Update"{
            if let msg = contacts[name]{
                if msg != email {
                    updateContact(name:name, email:email)
                } else {
                    updateContact(name:name, email:msg)
                }
            } else {
                print("Error: Could not find contact to update based on name")
            }
            updateContact(name:name, email:email)
        } else {
            print("Error: Did not enter the proper action of new or update for this interface")
        }
        let contact:String = names[position]
        return (contact, contacts[contact]!)
    }
}
