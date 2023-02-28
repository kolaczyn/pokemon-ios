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
                NavigationStack {
                    ContentView()
                        .navigationTitle("Pokemon")
                }
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                AboutView()
                    .tabItem {
                        Label("About", systemImage: "info")
                    }
            }
            .environmentObject(counter)
        }
        
    }
}
