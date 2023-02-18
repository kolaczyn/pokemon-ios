//
//  PokemonView.swift
//  Pokemon
//
//  Created by Paweł Kołaczyński on 17/02/2023.
//

import SwiftUI

struct PokemonTile: View {
    var species: String
    var id: String
    var url: String
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            PokemonImageView(url: url)
            Text(species).bold()
            Text("#\(id)")
        }
    }
}

struct PokemonTile_Previews: PreviewProvider {
    static var previews: some View {
        PokemonTile(
            species: "ivysaur",
            id: "2",
            url:  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png")
    }
}
