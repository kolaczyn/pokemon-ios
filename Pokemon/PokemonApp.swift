//
//  PokemonApp.swift
//  Pokemon
//
//  Created by Paweł Kołaczyński on 11/02/2023.
//

import SwiftUI

struct CartItem {
    var id: String
    var quantity: Int
}

class Cart: ObservableObject {
    @Published var value = [CartItem]()
    
    func add(id: String) {
        let element = value.contains(where: {$0.id==id})
        if element {
            value = value.map({$0.id == id ? CartItem(id: id, quantity: $0.quantity + 1) : $0})
            return
        }
        value.append(CartItem(id: id, quantity: 1))
    }
    
    func remove(id: String) {
        let element = value.first(where: {$0.id==id})
        if element?.quantity == 1 {
            value = value.filter({$0.id != id})
            return
        }
        if element != nil {
            value = value.map({$0.id == id ? CartItem(id: id, quantity: $0.quantity - 1) : $0})
            return
        }
    }
    
    func getQuantity(id: String) -> Int? {
        let element = value.first(where: {$0.id==id})
        return element?.quantity
    }
}

@main
struct PokemonApp: App {
    @StateObject var cart = Cart()
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
                CartView()
                    .tabItem {
                        Label("Cart", systemImage: "cart")
                    }
                AboutView()
                    .tabItem {
                        Label("About", systemImage: "info")
                    }
            }
            .environmentObject(cart)
        }
    }
}
