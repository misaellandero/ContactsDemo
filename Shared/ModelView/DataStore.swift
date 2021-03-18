//
//  DataStore.swift
//  ContactsDemo (iOS)
//
//  Created by Francisco Misael Landero Ychante on 16/03/21.
//


import SwiftUI

class DataStore: ObservableObject {

    @Published private(set) var  data : DataStoreModel
    
    //To save in userdefaults
    static let saveKey = "userData"
    
    init() {
        //get dato from userdefaults
        if let userData = UserDefaults.standard.data(forKey: Self.saveKey) {
            if let decoded = try? JSONDecoder().decode(DataStoreModel.self, from: userData){
                // set data to var userdefaults
                self.data = decoded
                return
            }
        }
        
        // if we dont have data create a new instace
        self.data = DataStoreModel(contacts: [ContactModel](), tags: [TagModel]())
    }
    
    //Save data to userDeafults on everychange
    private func save() {
        if let encoded = try? JSONEncoder().encode(data){
            UserDefaults.standard.set(encoded, forKey: Self.saveKey)
        }
    }
    
    //AddContact
    func addNewContact(contact : ContactModel){
        objectWillChange.send()
        data.contacts.append(contact)
        save()
    }
    
    //AddTag
    func addNewTag(tag : TagModel){
        objectWillChange.send()
        data.tags.append(tag)
        save()
    }
    /*
    mutating func addContact(contact : ContactModel){
        contacts.append(contact)
    }
    
    func removesContact(contact : ContactModel){
        if let index = contacts.firstIndex(of: contact) {
            contacts.remove(at: index)
        }
    }
     
    mutating func addTag(tag : TagModel){
        tags.append(tag)
    }
    
    func removesTag(tag : TagModel){
        if let index = tags.firstIndex(of: tag) {
            tags.remove(at: index)
        }
    }
 */
    
    func getContacTags(contact: ContactModel) -> [TagModel]{
        var contactTags =  [TagModel]()
        for tagid in contact.tags {
            if let i = data.tags.firstIndex(where: { $0.id == tagid }) {
                contactTags.append(data.tags[i])
            }
        }
        return contactTags
    }
    
}
