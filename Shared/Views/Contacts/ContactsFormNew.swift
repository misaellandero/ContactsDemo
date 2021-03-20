//
//  ContactsFormNew.swift
//  ContactsDemo
//
//  Created by Francisco Misael Landero Ychante on 17/03/21.
//

import SwiftUI

struct ContactsFormWindow: View {
    
    // MARK: - To close the sheet
    @Environment(\.presentationMode) var presentationMode
    // MARK: - Data model
    @Binding var contact : ContactModel
    // MARK: - Callback
    let save : () -> Void
    
    var body: some View {
        
        #if os(iOS)
        NavigationView{
            List{
                ContactsFormNew(contact: $contact, save: save)
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("New Contact")
                .toolbar {
                    ToolbarItem(placement: .primaryAction ){
                        Button(action: save) {
                            Label("Save", systemImage: "person.crop.circle.fill.badge.plus")
                        }
                    }
                }
        }
        #elseif os(macOS)
        VStack{
            HStack{
                Text("\(Image(systemName: "person.crop.circle.fill")) New Contact")
                    .font(.title)
                Spacer()
                Button(action:{self.presentationMode.wrappedValue.dismiss()}){
                    Label("Cancel", systemImage: "xmark.circle.fill")
                }
            }
            .padding()
            //List{
            Form{
                ContactsFormNew(contact: $contact, save: save)
            }
                
            //}
            //.listStyle(SidebarListStyle())
            //.frame(width: 400, height: 400)
        }
        .padding()
         
        #endif
         
    }
}
 
struct ContactsFormNew: View {
  
    @State private var showPopoverEmoji: Bool = false
    @State private var showPopoverTags: Bool = false
    @State private var showPopoverAddTags: Bool = false
    @State var animate : Bool = false
    
    @Binding var contact : ContactModel
    let save : () -> Void
    
    // MARK: - Screen Size for determining ipad or iphone screen
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif
    
    var body: some View {
        HStack{
            Button(action:showEmojiPicker){
                Text(contact.emoji)
                    .scaleEffect(animate ? 1.2 : 1)
                    .animation(.easeInOut)
            }
            .popover(
                isPresented: self.$showPopoverEmoji,
                arrowEdge: .top
            ) {
                #if os(iOS)
                if horizontalSizeClass == .compact {
                    EmojiSelecter(emoji: $contact.emoji.onChange(showChange))
                } else {
                    EmojiPicker(emoji: $contact.emoji.onChange(showChange))
                }
                #elseif os(macOS)
                EmojiPicker(emoji: $contact.emoji.onChange(showChange))
                #endif
            }
            
            TextField("Name", text: $contact.name)
        }
        Picker("Type", selection: $contact.type){
            ForEach(contactType.allCases, id: \.self){ value in
                Text(value.localizedName)
                    .tag(value)
            }
        }
        HStack{
            TextField("Email", text: $contact.email)
        }
        
        HStack{
            TextField("Phone", text: $contact.number)
        }
        
        DatePicker("Birthday", selection: $contact.birthDate)
            //.datePickerStyle(GraphicalDatePickerStyle())
        #if os(iOS)
        Section(){
            Button(action:save){
                HStack{
                    Spacer()
                    Label("Save", systemImage: "person.crop.circle.fill.badge.plus").padding()
                        .foregroundColor(.white)
                    Spacer()
                }
            }.listRowBackground(Color.blue)
        }
        
        
        #elseif os(macOS)
        HStack{
            Spacer()
            Button(action:save){
                Label("Save", systemImage: "person.crop.circle.fill.badge.plus")
            }
        }
        #endif
    }
    
    func showChange(_ tag: String){
        self.animate = true
        #if os(iOS)
        showEmojiPicker()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.animate = false
        }
        #elseif os(macOS)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.animate = false
        }
        #endif
        
    }
    
    func showEmojiPicker(){
        withAnimation{
            self.showPopoverEmoji.toggle()
        }
    }
    
    func showAddTagsPicker(){
        withAnimation{
            self.showPopoverAddTags.toggle()
        }
    }
    
    func showTagsPicker(){
        withAnimation{
            self.showPopoverTags.toggle()
        }
    }
    
}
struct ContactsFormNew_Previews: PreviewProvider {
    static var previews: some View {
        ContactsFormNew(contact: .constant(ContactModel.sampleContact), save: {})
    }
}
