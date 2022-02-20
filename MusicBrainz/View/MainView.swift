//
//  MainView.swift
//  MusicBrainz
//
//  Created by Marcin on 17/02/2022.
//

import Foundation
import SwiftUI

struct MainView: View {
   
    @State var data: [PlacesModel] = []
    @EnvironmentObject var MapVM : MapViewModel
    
    var body: some View {
        
        VStack{
            List(data){ data in
                ZStack{
                    HStack{
                        VStack{
                            
                            Text(data.name) // place name
                                .font(.system(size:12))
                        }
                        Spacer()
                        VStack{
                            if data.coordinates?.longitude != nil {  // if we have coordinate data
                                Image(systemName: "map.circle")
                                    .resizable()
                                    .frame(width: 22, height: 22)
                                    .opacity(0.8)
                            }else{
                                Image(systemName: "mappin.slash.circle")  // if we don't have coordinate data
                                    .resizable()
                                    .frame(width: 22, height: 22)
                                    .foregroundColor(Color.red)
                                    .opacity(0.3)
                            }
                        }
                    }
                    if data.coordinates?.longitude != nil && data.coordinates?.latitude != nil{   // if we have coordinate data
                        let longitude = data.coordinates?.longitude as! String
                        let latitude = data.coordinates?.latitude as! String
                        let longitudeDouble = Double(longitude)
                        let latitudeDouble = Double(latitude)
                        let name = data.name
                        
                        if data.lifespan?.begin != nil {  // if we have begin data data
                            let begin = String(data.lifespan!.begin) as! NSString
                            let yearBeginString = begin.substring(to: 4) as! String
                            let yearBegin = Int(yearBeginString)
                            
                            if data.lifespan?.end != nil{   // if we have end data
                                let end = String(data.lifespan!.end!) as! NSString
                                let yearEndString = end.substring(to: 4) as! String
                                let yearEnd = Int(yearEndString)
                               

                                Button{   // if we have end date
                                    MapVM.name = name
                                    MapVM.begin = yearBegin!
                                    MapVM.end = yearEnd!
                                    MapVM.longitude = longitudeDouble!
                                    MapVM.latitude = latitudeDouble!
                                    MapVM.longitude = longitudeDouble!
                                    MapVM.latitudeDisplay = latitudeDouble!
                                    MapVM.time = yearEnd! - yearBegin!
                                    MapVM.showMap.toggle()
                                }label:{
                                }
                            }else{
                                let noYearEnd = 2022 as Int
                                Button{   // if we don't have end date
                                    
                                    MapVM.name = name
                                    MapVM.begin = yearBegin!
                                    MapVM.end = noYearEnd as Int
                                    MapVM.longitude = longitudeDouble!
                                    MapVM.latitude = latitudeDouble!
                                    MapVM.longitudeDispay = longitudeDouble!
                                    MapVM.latitudeDisplay = latitudeDouble!
                                    MapVM.time = noYearEnd - yearBegin!
                                    MapVM.showMap.toggle()
                                }label:{
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
         .padding(.top, 20)
            .onAppear {
                Getdata().getdata { (json) in
                    self.data = json
                }
            }
    }
}
