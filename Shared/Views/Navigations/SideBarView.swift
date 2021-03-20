//
//  SideBarView.swift
//  ContactsDemo
//
//  Created by Francisco Misael Landero Ychante on 17/03/21.
//

import SwiftUI

struct SideBarView: View {
    
    // MARK: - current section selected
    @Binding var sectionSelected : SectionSelected?
    // MARK: - Data model
    @EnvironmentObject var datastore : DataStore
    var body: some View {
        NavigationView{
            // MARK: - Side bar
            List(selection: $sectionSelected) {
                NavigationLink(destination: ContactsList(), tag: SectionSelected.all, selection: $sectionSelected) {
                    Label("Contacts", systemImage: "person.2.fill")
                    
                }.accentColor(datastore.getColor())
                
                
                NavigationLink(destination: SettingsList() , tag: SectionSelected.settings, selection: $sectionSelected) {
                    Label("Settings", systemImage: "gear")
                }.accentColor(datastore.getColor())
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 250, idealWidth: 250, maxWidth: 350)
            .navigationTitle("Contacts App")
            .toolbar {
                //Toggle Sidebar Button
                #if os(macOS) 
                ToolbarItem(placement: .navigation){
                    Button(action: toggleSidebar) {
                        Image(systemName: "sidebar.left")
                            .foregroundColor(datastore.getColor())
                            .help("Toggle Sidebar")
                    }
                }
                #endif
            }
             
            // MARK: - Current selection
            // You won't see this in practice (default selection)
            Text("No Sidebar Selection")
               
            // MARK: - Detail View
            Text("No Detail Selection")
                
        }
    }
    
    #if os(macOS)
    private func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?
            .tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
    #endif
     
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView(sectionSelected: .constant(.all))
    }
}
