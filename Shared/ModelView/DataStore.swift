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
        self.data = DataStoreModel(contacts: [ContactModel]())
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
    
    func deleteContact(at offsets: IndexSet) {
        objectWillChange.send()
        data.contacts.remove(atOffsets: offsets)
        save()
    }
  
    
}
