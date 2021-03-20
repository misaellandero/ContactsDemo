//
//  ContactsList.swift
//  ContactsDemo (iOS)
//
//  Created by Francisco Misael Landero Ychante on 17/03/21.
//

import SwiftUI

struct ContactsList: View {
    
    @EnvironmentObject var datastore : DataStore
    
    @State private var showModalAddContact = false
    
    @State var contactModel = ContactModel.newContactTemplate
    
    var body: some View {
        List{
            ForEach(datastore.data.contacts, id: \.id){ contact in
               NavigationLink(
                destination: ContactsDetail(contact: contact),
                label: {
                    ContactsRow(contact: contact)
                })
            }.onDelete(perform: datastore.deleteContact)
        }
        .toolbar {
            //AddContact
            ToolbarItem(placement: .primaryAction){
                Button(action: showForm) {
                    Label("New", systemImage: "person.crop.circle.fill.badge.plus")
                }
            }
        }
        .sheet(isPresented: $showModalAddContact){
            ContactsFormWindow(contact: $contactModel , save: savecontact)
        }
    }
    
    func showForm(){
        withAnimation(.spring()){
            showModalAddContact.toggle()
        }
    }
    
    func savecontact(){
        datastore.addNewContact(contact: contactModel)
        contactModel = ContactModel(id: UUID(), name: "", emoji: "", email: "", number: "", birthDate: Date(), type: .friend)
        withAnimation(.spring()){
            showModalAddContact.toggle()
        }
    }
}

struct ContactsList_Previews: PreviewProvider {
    static var previews: some View {
        ContactsList()
    }
}
