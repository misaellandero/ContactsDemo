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
            Section(header: Text("Main Data")){
                HStack{
                    Text("\(contact.emoji) \(contact.name)")
                }
                .font(.largeTitle)
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
            }
        }
    }
}

struct ContactsDetail_Previews: PreviewProvider {
    static var previews: some View {
        ContactsDetail(contact: ContactModel.sampleContact)
    }
}
