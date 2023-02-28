//
//  CartView.swift
//  Pokemon
//
//  Created by Paweł Kołaczyński on 28/02/2023.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cart: Cart;
    var body: some View {
        VStack {
            Text("This is shopping cart")
            List(cart.value, id: \.id) { pokemon in
                Text("You have \(pokemon.quantity) times Pokemon #\(pokemon.id)")
            }
        }
    }
}
