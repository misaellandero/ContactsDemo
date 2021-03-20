//
//  ContactsDetail.swift
//  ContactsDemo (iOS)
//
//  Created by Francisco Misael Landero Ychante on 17/03/21.
//

import SwiftUI

struct ContactsDetail: View {
    let contact : ContactModel
    var body: some View {
        List{
            HStack{
                Text("\(contact.emoji) \(contact.name)")
            }
            .font(.largeTitle)
            
            Section(header: Text("Main Data")){
               
                HStack{
                    Text("\(Image(systemName: "phone.fill")) \(contact.number)")
                }
                HStack{
                    Text("\(Image(systemName: "envelope.fill")) \(contact.email)")
                }
            }
            
            Section(header: Text("Personal Data")){
                HStack{
                    Text("\(Image(systemName: "calendar.badge.exclamationmark")) Birthday   \(contact.birthDateFormatter)")
                }
                HStack{
                    Text("\(Image(systemName: "calendar")) Age \(contact.age)")
                }
                
                Button(action:callPhone){
                    Label("Call", systemImage: "phone.fill")
                }
                
            }
        } 
    }
    
    func callPhone(){
        let dash = CharacterSet(charactersIn: "-")
        let cleanString = contact.number.trimmingCharacters(in: dash)
        let tel = "tel://"
        let formattedString = tel + cleanString
        
        let url: NSURL = URL(string: formattedString)! as NSURL
        
            #if os(iOS)
            UIApplication.shared.open(url as URL)
            #else
            NSWorkspace.shared.open(url as URL)
            #endif
    }
}

struct ContactsDetail_Previews: PreviewProvider {
    static var previews: some View {
        ContactsDetail(contact: ContactModel.sampleContact)
    }
}
