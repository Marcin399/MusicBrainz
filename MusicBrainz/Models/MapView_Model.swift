//
//  MapView_Model.swift
//  MusicBrainz
//
//  Created by Marcin on 17/02/2022.
//

import Foundation
import MapKit
import SwiftUI



struct MyAnnotationItem: Identifiable {
    var coordinate: CLLocationCoordinate2D
    let id = UUID()
    var togle : Bool = false
    
}

class MapViewModel : ObservableObject{
    
    @Published var name : String?
    @Published var begin : Int?
    @Published var end : Int?
    @Published var longitude : Double = 0
    @Published var latitude : Double = 0
    @Published var longitudeDispay : Double = 0
    @Published var latitudeDisplay : Double = 0
    @Published var showMap : Bool = false
    @Published var time: Int = 10
    @Published var annotationItems : [MyAnnotationItem] = [MyAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0))]
      
    } // end class


        
