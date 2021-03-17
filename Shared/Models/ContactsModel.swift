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
        return DateFormatter.mediumDateTimeFormatter.string(from: birthDate)
    }
    
    //Get age
    var age : Int {
        return  Calendar.current.dateComponents([.hour], from: birthDate, to: Date()).year ?? 0
    }
}

  
