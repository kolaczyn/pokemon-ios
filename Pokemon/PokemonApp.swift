//
//  PokemonApp.swift
//  Pokemon
//
//  Created by Paweł Kołaczyński on 11/02/2023.
//

import SwiftUI

class Counter: ObservableObject {
    @Published var value = 0
}

@main
struct PokemonApp: App {
    @StateObject var counter = Counter()
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem{
                        Label("Pokemon", systemImage: "list.dash")
                    }
                AboutView()
                    .tabItem {
                        Label("About", systemImage:  "info.circle")
                    }
            }.environmentObject(counter)
        }
        
    }
}
