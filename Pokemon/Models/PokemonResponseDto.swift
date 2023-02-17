//
//  PokemonDto.swift
//  Pokemon
//
//  Created by Paweł Kołaczyński on 17/02/2023.
//

struct PokemonResponseDto: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PokemonDto]
}

