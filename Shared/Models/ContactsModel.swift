//
//  ContactsModel.swift
//  ContactsDemo (iOS)
//
//  Created by Francisco Misael Landero Ychante on 16/03/21.
//

import SwiftUI

struct ContactModel : Identifiable, Codable {
    // MARK: - For Identifiable
    var id = UUID()
    
    // MARK: - Contact Data
    var name : String
    var emoji : String
    var tags : [UUID]
    var email : String
    var number : String
    var birthDate : Date
    
    // MARK: - Computed Properities
    //Get date formated
    var birthDateFormatter : String {
        //DateFormatter extension
        return DateFormatter.mediumDateFormatter.string(from: birthDate)
    }
    
    //Get age
    var age : Int {
        return  Calendar.current.dateComponents([.year], from: birthDate, to: Date()).year ?? 0
    }
    
    // MARK: - sampleData
    static var newContactTemplate : ContactModel {
        
        return ContactModel(id: UUID(), name: "", emoji: "🙂", tags: [], email: " ", number: "", birthDate: Date())
    }
    
    static var sampleContact : ContactModel {
        
        return ContactModel(id: UUID(), name: "Juan Perez", emoji: "👨🏻‍💼", tags: [UUID(),UUID()], email: "juan@perez.com", number: "5566123234", birthDate: Date())
    }
    
    static var sampleContactList : [ContactModel] {
        return [
            ContactModel(id: UUID(), name: "Juan Perez", emoji: "👨🏻‍💼", tags: [UUID(),UUID()], email: "juan@perez.com", number: "5566123234", birthDate: Date()),
            ContactModel(id: UUID(), name: "Maria Hernadez", emoji: "👩🏼", tags: [UUID(),UUID()], email: "maria@hernandez.com", number: "5566123234", birthDate: Date()),
            ContactModel(id: UUID(), name: "Pedro Lara", emoji: "👴🏽", tags: [UUID(),UUID()], email: "pedro@lara.com", number: "5566123234", birthDate: Date())
                ]
    }
    
}

  
