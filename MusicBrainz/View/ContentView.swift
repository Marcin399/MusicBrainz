//
//  ContentView.swift
//  MusicBrainz
//
//  Created by Marcin on 15/02/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var MapVM : MapViewModel
   
    @State var data: [PlacesModel] = []
    
    var body: some View {
        VStack{
            if MapVM.showMap == false {
                MainView()
            }else{
                MapView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


