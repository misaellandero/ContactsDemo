//
//  DataStore.swift
//  ContactsDemo (iOS)
//
//  Created by Francisco Misael Landero Ychante on 16/03/21.
//


import SwiftUI

class DataStore: ObservableObject {

    @Published var data : DataStoreModel
    
    //To save in userdefaults
    static let saveKey = "userData"
    
    init() {
        //get dato from userdefaults
        if let userData = UserDefaults.standard.data(forKey: Self.saveKey) {
            if let decoded = try? JSONDecoder().decode(DataStoreModel.self, from: data){
                // set data to var userdefaults
                self.data = decoded
                return
            }
        }
        
        // if we dont have data create a new instace
        self.data = DataStoreModel()
    }
    
    //Save data to userDeafults on everychange
    func save() {
        if let encoded = try? JSONEncoder().encode(data){
            UserDefaults.standard.set(encoded, forKey: Self.saveKey)
        }
    }
    
    //AddContact
    func addNewContact(contact : ContactModel){
        objectWillChange.send()
        data.addContact(contact: contact)
        save()
    }
    
    //AddTag
    func addNewTag(tag : ContactModel){
        objectWillChange.send()
        data.addTag(tag: tag)
        save()
    }
    
}
