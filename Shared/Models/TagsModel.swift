//
//  TagsModel.swift
//  ContactsDemo (iOS)
//
//  Created by Francisco Misael Landero Ychante on 16/03/21.
//

import SwiftUI

struct TagModel : Identifiable, Codable {
    // MARK: - For Identifiable
    var id : UUID
    var tag : String
    var color : Int
    //SwiftUI Color
    func getColor()-> Color {
        return AppColorsModel.colors[color].color
    }
    
    // MARK: - sampleData
    
    static var sampleTag : TagModel {
        return TagModel(id: UUID(), tag: "Friend", color: 1)
    }
    
    static var sampleTagsList : [TagModel] {
        return [
                TagModel(id: UUID(), tag: "Friend", color: 1),
                TagModel(id: UUID(), tag: "Family", color: 10)]
    }
    
}

 
