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
        VStack {
            
            var annotationItems: [MyAnnotationItem] = [
                MyAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: self.MapVM.latitude, longitude: self.MapVM.longitude))
            ]
            
        
            Map(coordinateRegion: $newRegion,
                annotationItems: annotationItems) {item in
                MapPin(coordinate: item.coordinate)}
            
            Spacer()
           
                VStack{
            Button{
                MapVM.showMap.toggle()
            }label: {
               Text("return")
               
            }
                    Text("\(MapVM.time)")
                }
            
            .frame(width: UIScreen.main.bounds.width-20, height: 40)
            .background(Color.white)
            .cornerRadius(20)
            .padding(.bottom, 20)
        }.onReceive((timer), perform: { time in
            if MapVM.time > 0 {
            MapVM.time -= 1
            }
            if MapVM.time <= 0{
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


