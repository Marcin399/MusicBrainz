//
//  MusicBrainzApp.swift
//  MusicBrainz
//
//  Created by Marcin on 15/02/2022.
//

import SwiftUI

@main
struct MusicBrainzApp: App {
    @StateObject var MapVM = MapViewModel()
    @StateObject var MainVM = MainViewModel()
    var body: some Scene {
        WindowGroup {
          ContentView()
                .environmentObject(MapVM)
                .environmentObject(MainVM)
                .ignoresSafeArea()
        }
    }
}
