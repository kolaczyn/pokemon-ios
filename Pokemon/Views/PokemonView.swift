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

struct PokemonView: View {
    let pokemon: PokemonDto
    var body: some View {
        VStack {
            PokemonTile(species: pokemon.name, id: pokemon.id, url: pokemon.imgUrl)
            Link("Visit me on Bulbapedia", destination: URL(string: getPokemonUrl(pokemon.name))!)
            
        }
    }
}
