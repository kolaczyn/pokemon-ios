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
        VStack(spacing: 5) {
            PokemonImageView(url: url)
            Text(species).bold()
            Text("#\(id)")
        }
    }
}
