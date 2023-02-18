//
//  PokemonListView.swift
//  Pokemon
//
//  Created by Paweł Kołaczyński on 18/02/2023.
//

import SwiftUI

struct PokemonListView: View {
    var pokemonDto: [PokemonDto]
    var body: some View {
        List(pokemonDto, id: \.id) { pokemon in
            NavigationLink(destination: PokemonView(pokemon: pokemon)) {
                PokemonTile(species: pokemon.name, id: pokemon.id, url: pokemon.imgUrl
                )
            }
        }
    }
}
