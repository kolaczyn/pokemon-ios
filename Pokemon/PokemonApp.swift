//
//  PokemonApp.swift
//  Pokemon
//
//  Created by Paweł Kołaczyński on 11/02/2023.
//

import SwiftUI

@main
struct PokemonApp: App {
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
            }
        }
        
    }
}
