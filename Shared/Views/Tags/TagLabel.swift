//
//  TagLabel.swift
//  ContactsDemo (iOS)
//
//  Created by Francisco Misael Landero Ychante on 17/03/21.
//

import SwiftUI

struct TagLabel: View {
    let tag : TagModel
    var body: some View {
        HStack{
            Text(tag.tag)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(2)
        }
        .background(tag.getColor())
        .cornerRadius(20)
    }
}

struct TagLabel_Previews: PreviewProvider {
    static var previews: some View {
        TagLabel(tag: TagModel.sampleTag)
    }
}
