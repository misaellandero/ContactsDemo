//
//  ContactsRow.swift
//  ContactsDemo (iOS)
//
//  Created by Francisco Misael Landero Ychante on 17/03/21.
//

import SwiftUI

struct ContactsRow: View {
    let contact : ContactModel
    let tags : [TagModel]
    var body: some View {
        HStack{
            Text(contact.emoji)
                .font(.largeTitle)
            VStack(alignment:.leading){
                Text("\(Image(systemName: "phone.fill") ) Phone \(contact.number)")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text(contact.name)
            }
            Spacer()
            Group{
                ForEach(tags, id: \.id){ tag in
                    TagLabel(tag: tag)
                }
            }
        }
        .padding()
    }
}

struct ContactsRow_Previews: PreviewProvider {
    
    
    static var previews: some View {
        ContactsRow(contact: ContactModel.sampleContact, tags: TagModel.sampleTagsList)
            .previewLayout(.fixed(width: 400, height: 90))
            .preferredColorScheme(.dark)
        ContactsRow(contact: ContactModel.sampleContact, tags: TagModel.sampleTagsList)
            .previewLayout(.fixed(width: 400, height: 90))
    }
}
