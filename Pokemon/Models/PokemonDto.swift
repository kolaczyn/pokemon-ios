//
//  PokemonDto.swift
//  Pokemon
//
//  Created by Paweł Kołaczyński on 17/02/2023.
//

struct PokemonDto: Codable, Identifiable {
    let name: String
    let url: String
    var id: String {
        // couldn't come up with a better solution :p
        url
            .replacingOccurrences(of: "https://pokeapi.co/api/v2/pokemon/", with:"")
            .replacingOccurrences(of: "/", with: "")
    }
    var imgUrl: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
    }
}
