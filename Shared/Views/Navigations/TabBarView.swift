//
//  TabBarView.swift
//  ContactsDemo
//
//  Created by Francisco Misael Landero Ychante on 17/03/21.
//

import SwiftUI

struct TabBarView: View {
    
    // MARK: - current section selected
    @Binding var sectionSelected : SectionSelected?
    // MARK: - Data model
    @EnvironmentObject var datastore : DataStore
    var body: some View {
        TabView(selection: $sectionSelected){
            // MARK: - Contacts
            NavigationView{
                ContactsList()
                .navigationTitle("Contacts")
            }
            .tabItem {
                Label("Contacts", systemImage: "person.2.fill")
            }
            .tag(SectionSelected.all)
             
            
            // MARK: - Settings
            NavigationView{
                SettingsList()
                .navigationTitle("Settings")
            }
            .tabItem {
                Label("Settings", systemImage: "gear")
            }
            .tag(SectionSelected.settings)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(sectionSelected: .constant(.all))
    }
}
