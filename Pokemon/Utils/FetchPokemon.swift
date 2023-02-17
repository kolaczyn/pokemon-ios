//
//  FetchPokemon.swift
//  Pokemon
//
//  Created by Paweł Kołaczyński on 17/02/2023.
//

import Foundation

enum PokemonFetchError : Error {
    case somethingWentWrong
}

typealias CompletionHandler = (Result<PokemonResponseDto, Error>) -> ()

func fetchPokemon(_ completionHandler: @escaping CompletionHandler) {
    let pokemonApiUrl = "https://pokeapi.co/api/v2/pokemon"
    let url = URL(string: pokemonApiUrl)!
    let request = URLRequest(url: url)
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
            if let response = try? JSONDecoder().decode(PokemonResponseDto.self, from: data) {
                DispatchQueue.main.async {
                    return completionHandler(.success(response))
                }
            }
        }
        return completionHandler(.failure(PokemonFetchError.somethingWentWrong))
    }.resume()
}
