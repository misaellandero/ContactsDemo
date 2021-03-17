//
//  DataStoreModel.swift
//  ContactsDemo (iOS)
//
//  Created by Francisco Misael Landero Ychante on 16/03/21.
//

import SwiftUI

struct DataStoreModel: Codable {
    var contacts : [ContactModel]
    var tags : [TagModel]
    
    func addContact(contact : ContactModel){
        contacts.push(contact)
    }
    
    func addTag(tag : TagModel){
        contacts.push(tag)
    }
    
    func getContacTags(contact: ContactModel) -> [TagModel]{
        var contactTags =  [TagModel]()
        for tagid in contact.tags {
            if let i = tags.firstIndex(where: { $0.id == tagid }) {
                contactTags.append(tags[i])
            }
        }
        return contactTags
    }
    
}

 
