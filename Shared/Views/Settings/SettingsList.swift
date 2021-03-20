//
//  SettingsList.swift
//  ContactsDemo (iOS)
//
//  Created by Francisco Misael Landero Ychante on 19/03/21.
//

import SwiftUI

struct SettingsList: View {
    
    // MARK: - Data model
    @EnvironmentObject var datastore : DataStore
    
    var body: some View {
        List{ 
            Section(header: Text("Chose Accent Color")){
                NavigationLink(destination: AccentColorPicker(colorSelect: datastore.data.accentColor)){
                    Label(" Color", systemImage: "paintpalette.fill")
                        .foregroundColor(datastore.getColor())
                }
            }
        }
        
    }
    
     
}

struct AccentColorPicker: View{
    
    // MARK: - Data model
    @EnvironmentObject var datastore : DataStore
    @State var colorSelect : Int = 0
    
    var body: some View {
        List{
            Picker(selection: $colorSelect.onChange(colorChange), label: Label("Color", systemImage: "paintbrush.fill") , content: {
                ForEach(0..<AppColorsModel.colors.count){ index in
                    HStack{
                        Image(systemName: "paintbrush.pointed.fill")
                        Text(AppColorsModel.colors[index].name)
                    }
                    .foregroundColor(AppColorsModel.colors[index].color)
                    .tag(index)
                }
            })
            .pickerStyle(InlinePickerStyle())
            .labelsHidden()
        }
        
    }
    
    func colorChange(tag : Int){
        datastore.changeAccentColor(index: tag)
    }
    
}

struct SettingsList_Previews: PreviewProvider {
    static var previews: some View {
        SettingsList()
    }
}
