//
//  TagPicker.swift
//  ContactsDemo
//
//  Created by Francisco Misael Landero Ychante on 17/03/21.
//

import SwiftUI

struct TagWindow: View {
    
    @Binding var showPicker : Bool
    @Binding var tags : [UUID]
    var body: some View {
        #if os(iOS)
        TagSelecter(tags: $tags, showPicker: $showPicker)
        #elseif os(macOS)
        TagPicker(tags: $tags, showPicker: $showPicker)
        #endif
    }
    
    
    
}

struct TagPicker: View {
    @Binding var tags : [UUID]
    @Binding var showPicker : Bool
    
    var body: some View {
        VStack{
             TagList(tags: $tags, showPicker: $showPicker)
        }
        .frame(width: 300, height: 300)
    }
     
}

 
struct TagSelecter: View {
     
    // MARK: - Data store to get al exiting tags
    @EnvironmentObject var datastore : DataStore
    
    @Binding var tags : [UUID]
    @Binding var showPicker : Bool
    
    var body: some View {
        NavigationView{
            TagList(tags: $tags, showPicker: $showPicker)
                .navigationTitle("Select Tag")
        }
    }
 
}

struct TagList : View {
    
    // MARK: - Data store to get al exiting tags
    @EnvironmentObject var datastore : DataStore
    
    @Binding var tags : [UUID]
    @Binding var showPicker : Bool
    
    var body: some View {
        List {
            ForEach(datastore.data.tags, id: \.id){ tag in
                Button(action: {addTag(tag: tag)}){
                    HStack{
                        Spacer()
                        Text(tag.tag)
                            .padding()
                        Spacer()
                    }
                }.listRowBackground(tag.getColor())
            }
        }
    }
    
    func addTag(tag: TagModel){
        tags.append(tag.id)
        showPicker.toggle()
    }
}
