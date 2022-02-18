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
    var body: some Scene {
        WindowGroup {
          ContentView()
                .environmentObject(MapVM)
                .ignoresSafeArea()
        }
    }
}
