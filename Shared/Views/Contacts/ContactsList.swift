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
                ContactsRow(contact: contact, tags: datastore.getContacTags(contact: contact))
            }
        }
        .toolbar {
            //AddContact
            ToolbarItem(placement: .primaryAction){
                Button(action: {showModalAddContact.toggle()}) {
                    Label("New", systemImage: "person.crop.circle.fill.badge.plus")
                }
            }
        }
        .sheet(isPresented: $showModalAddContact){
            ContactsFormWindow(contact: $contactModel , save: {})
        }
    }
}

struct ContactsList_Previews: PreviewProvider {
    static var previews: some View {
        ContactsList()
    }
}
