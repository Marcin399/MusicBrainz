//
//  MapView.swift
//  MusicBrainz
//
//  Created by Marcin on 16/02/2022.
//


import SwiftUI
import MapKit

struct MapView: View {
    
    @EnvironmentObject var MapVM : MapViewModel
    @State var newRegion = MKCoordinateRegion()
    
    let timer = Timer.publish(every: 1,  on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
           
            
            var annotationItems = [  // pin cordinates
                MyAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: self.MapVM.latitude, longitude: self.MapVM.longitude))
            ]
            
            Map(coordinateRegion: $newRegion, // map view
                annotationItems: annotationItems) {item in
                MapPin(coordinate: item.coordinate)}
                
            Spacer()
            ZStack{
                Rectangle() // white rectangle on bottom
                    .foregroundColor(Color.white)
                    .frame(width: UIScreen.main.bounds.width, height: 200)
                    .cornerRadius(30)
                    .shadow(color: (Color.black.opacity(0.4)), radius: 30, x: 0, y: 0)
                
                VStack{
                    Text("\(MapVM.name!)") // name
                        .fontWeight(.bold)
             
                    HStack{
                        Text("longitude: \(MapVM.longitudeDispay)")
                        Text("latitude: \(MapVM.latitudeDisplay)") 
                    }
                    Text("\(MapVM.time)") // timer countdown
                        .padding(.top,1)
                        .foregroundColor(MapVM.time > 0 ? .black : .clear)
                   
                    Button{
                        MapVM.showMap.toggle()
                    }label: {
                        ZStack{
                            Text("return") // return button
                                .padding(1)
                        }
                    }
                }
            }
            .offset(x: 0, y: (UIScreen.main.bounds.height / 2) - 100)
            
        }.onReceive((timer), perform: { time in
            if MapVM.time > 0 {
                MapVM.time -= 1
            }
            if MapVM.time <= 0{  // pin wipe aut
                MapVM.longitude = 1000
                MapVM.latitude = 1000
            }
        })
            .onAppear {
                newRegion.center.longitude = MapVM.longitude
                newRegion.center.latitude = MapVM.latitude
                newRegion.span.latitudeDelta = 0.01
                newRegion.span.longitudeDelta = 0.01
            }
    }
}


