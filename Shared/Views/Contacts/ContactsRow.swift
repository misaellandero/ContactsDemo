//
//  ContactsRow.swift
//  ContactsDemo (iOS)
//
//  Created by Francisco Misael Landero Ychante on 17/03/21.
//

import SwiftUI

struct ContactsRow: View {
    let contact : ContactModel
    var body: some View {
        HStack{
            Text(contact.emoji)
                .font(.largeTitle)
            VStack(alignment:.leading){
                Text("\(Image(systemName: "phone.fill") ) Phone \(contact.number)")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                HStack{
                    Text(contact.name)
                    HStack{
                        Text(contact.type.localizedName)
                            .font(.caption)
                            .foregroundColor(.primary)
                            .padding(1)
                    }
                    .background(Color.secondary)
                    .cornerRadius(20)
                }
            }
            Spacer()
             
        }
        .padding()
    }
}

struct ContactsRow_Previews: PreviewProvider {
    
    
    static var previews: some View {
        ContactsRow(contact: ContactModel.sampleContact)
            .previewLayout(.fixed(width: 400, height: 90))
            .preferredColorScheme(.dark)
        ContactsRow(contact: ContactModel.sampleContact )
            .previewLayout(.fixed(width: 400, height: 90))
    }
}
