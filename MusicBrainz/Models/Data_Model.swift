//
//  Data_Model.swift
//  MusicBrainz
//
//  Created by Marcin on 15/02/2022.
//

import Foundation
import UIKit

struct DataModel : Decodable{
//here is enum because the server returns key with " - "
    enum CodingKeys : String, CodingKey{
        case created = "created"
        case count = "count"
        case places = "places"
    }
    var created : String
    var count : Int
    var places : [PlacesModel]
}

struct PlacesModel : Decodable ,Identifiable{
  
    enum CodingKeys : String, CodingKey{
        case id = "id"
        case name = "name"
        case coordinates = "coordinates"
        case lifespan = "life-span"
    }
    var id = UUID()
    let name: String
    let coordinates : CordinateModel?
    let lifespan : LifeSpan?
}


struct CordinateModel : Decodable{
    enum CodingKeys : String, CodingKey{
        case latitude = "latitude"
        case longitude = "longitude"
    }
    var latitude : String
    var longitude : String
}

struct LifeSpan : Decodable{
    var begin : String
    var end : String?
    
}

