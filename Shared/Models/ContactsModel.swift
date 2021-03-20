//
//  ContactsModel.swift
//  ContactsDemo (iOS)
//
//  Created by Francisco Misael Landero Ychante on 16/03/21.
//

import SwiftUI

enum contactType : String, Codable, Equatable, CaseIterable {
    case family = "Family", friend = "Friend", coworker = "Co-Worker"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

struct ContactModel : Identifiable, Codable {
    
     
    // MARK: - For Identifiable
    var id = UUID()
    
    // MARK: - Contact Data
    var name : String
    var emoji : String
    var email : String
    var number : String
    var birthDate : Date
    var type: contactType
    
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
        
        return ContactModel(id: UUID(), name: "", emoji: "🙂", email: "", number: "", birthDate: Date(), type: .coworker)
    }
    
    static var sampleContact : ContactModel {
        
        return ContactModel(id: UUID(), name: "Juan Perez", emoji: "👨🏻‍💼", email: "juan@perez.com", number: "5566123234", birthDate: Date(), type: .coworker)
    }
    
    static var sampleContactList : [ContactModel] {
        return [
            ContactModel(id: UUID(), name: "Juan Perez", emoji: "👨🏻‍💼",  email: "juan@perez.com", number: "5566123234", birthDate: Date(), type: .coworker),
            ContactModel(id: UUID(), name: "Maria Hernadez", emoji: "👩🏼",email: "maria@hernandez.com", number: "5566123234", birthDate: Date(), type: .coworker),
            ContactModel(id: UUID(), name: "Pedro Lara", emoji: "👴🏽",email: "pedro@lara.com", number: "5566123234", birthDate: Date(), type: .coworker)
                ]
    }
    
}

  
