//
//  TagNewForm.swift
//  ContactsDemo
//
//  Created by Francisco Misael Landero Ychante on 17/03/21.
//

import SwiftUI

 
struct TagFormWindow: View {
    
    @Binding var showPicker : Bool
 
    var body: some View {
        #if os(iOS)
        NavigationView{
            List{
                TagNewForm(showPicker: $showPicker)
            }
            .navigationTitle("New Tag")
             
        }
        #elseif os(macOS)
        VStack{
            HStack{
                Text("\(Image(systemName: "tag.fill")) New Tag")
                    .font(.title)
                Spacer()
                Button(action:{showPicker.toggle()}){
                    Label("Cancel", systemImage: "xmark.circle.fill")
                }
            }
            .padding()
            List{
                TagNewForm(showPicker: $showPicker)
            }
            .listStyle(SidebarListStyle())
            .frame(width: 400, height: 400)
        }
        #endif
    }
    
     
}

struct TagNewForm: View {
    // MARK: - Data model
    @EnvironmentObject var datastore : DataStore
    @Binding var showPicker : Bool
    @State private var newTag = TagModel(id: UUID(), tag: "", color: 0)
    
    var body: some View {
        TextField("Tag", text: $newTag.tag)
        Picker("Color", selection: $newTag.color){
            ForEach(0..<AppColorsModel.colors.count){ index in
                HStack{
                    Spacer()
                    Text(AppColorsModel.colors[index].name)
                        .padding()
                    Spacer()
                }
                .background(AppColorsModel.colors[index].color)
                .tag(index)
            }
        }
        .pickerStyle(InlinePickerStyle())
        Button(action:saveTag){
            HStack{
            Spacer()
            Label("Save", image: "tag")
            Spacer()
            }
        }
        
    }
    
    func saveTag(){
        datastore.addNewTag(tag: newTag)
        withAnimation(.spring()){
            showPicker = false
        }
    }
}

struct TagNewForm_Previews: PreviewProvider {
    static var previews: some View {
        TagNewForm(showPicker: .constant(false))
    }
}
