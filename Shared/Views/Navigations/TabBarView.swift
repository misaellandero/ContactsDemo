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
            .tag(SectionSelected.contacts)
            
            // MARK: - Tags
            NavigationView{
                Text("Tags")
            }
            .tabItem {
                Label("Tags", systemImage: "tag.fill")
            }
            .tag(SectionSelected.tags)
            
            // MARK: - Settings
            NavigationView{
                Text("Settings")
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
        TabBarView(sectionSelected: .constant(.contacts))
    }
}
