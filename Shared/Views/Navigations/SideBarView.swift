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
    
    var body: some View {
        NavigationView{
            // MARK: - Side bar
            List(selection: $sectionSelected) {
                NavigationLink(destination: ContactsList(), tag: SectionSelected.contacts, selection: $sectionSelected) {
                    Label("Contacts", systemImage: "person.2.fill")
                }
                
                NavigationLink(destination: Text("Tags"), tag: SectionSelected.tags, selection: $sectionSelected) {
                    Label("Tags", systemImage: "tag.fill")
                }
                
                NavigationLink(destination: Text("Settings"), tag: SectionSelected.settings, selection: $sectionSelected) {
                    Label("Settings", systemImage: "gear")
                }
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
        SideBarView(sectionSelected: .constant(.contacts))
    }
}
