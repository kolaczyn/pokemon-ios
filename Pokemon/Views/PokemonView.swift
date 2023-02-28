//
//  PokemonView.swift
//  Pokemon
//
//  Created by Paweł Kołaczyński on 18/02/2023.
//

import SwiftUI

func getPokemonUrl(_ name: String) -> String {
    "https://bulbapedia.bulbagarden.net/wiki/\(name)"
}

extension Int {
    var stringValue:String {
        "\(self)"
    }
}

struct PokemonView: View {
    @EnvironmentObject var cart: Cart;
    let pokemon: PokemonDto
    var body: some View {
        VStack {
            PokemonTile(species: pokemon.name, id: pokemon.id, url: pokemon.imgUrl)
            Link("Visit me on Bulbapedia", destination: URL(string: getPokemonUrl(pokemon.name))!)
            Spacer()
            HStack {
                Button("-", action: {
                    cart.remove(id: pokemon.id)
                })
                Text(cart.getQuantity(id: pokemon.id)?.stringValue ?? "Not in cart")
                Button("+", action: {
                    cart.add(id: pokemon.id)
                })
            }
        }
    }
}
