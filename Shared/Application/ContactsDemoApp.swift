//
//  ContactsDemoApp.swift
//  Shared
//
//  Created by Francisco Misael Landero Ychante on 15/03/21.
//

import SwiftUI

@main
struct ContactsDemoApp: App {
    
    // Data store
    var datastore = DataStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(datastore)
        }
    }
}
