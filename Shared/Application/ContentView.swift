//
//  ContentView.swift
//  Shared
//
//  Created by Francisco Misael Landero Ychante on 15/03/21.
//

import SwiftUI

enum SectionSelected {
    case all,family, friend, coworker, settings
}

struct ContentView: View {
    
    // MARK: - Screen Size for determining ipad or iphone screen
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif
    
    // MARK: - Data model
    @EnvironmentObject var datastore : DataStore
    
    
    // MARK: - current section selected
    @State var sectionSelected : SectionSelected? = .all
    
    var body: some View {
        Group{
            #if os(iOS)
            if horizontalSizeClass == .compact {
                TabBarView(sectionSelected : $sectionSelected)
                    .accentColor(datastore.getColor())
            } else {
                SideBarView(sectionSelected : $sectionSelected)
                    .accentColor(datastore.getColor())
            }
            #elseif os(macOS)
            SideBarView(sectionSelected : $sectionSelected)
            #endif
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
