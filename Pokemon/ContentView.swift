import SwiftUI

struct PokemonImageView: View {
    var url: String
    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
            
        } placeholder: {
            Color.gray.opacity(0.09).cornerRadius(12)
        }
        .frame(width: 200, height: 200)
    }
}

struct PokemonView: View {
    var species: String
    var id: Int
    var url: String
    
    var body: some View {
        VStack(spacing: 5) {
            PokemonImageView(url: url)
            Text(species).bold()
            Text("#\(id)")
        }
    }
}

struct Pokemon: Identifiable {
    let species: String
    let id: Int
    var imgUrl: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
    }
}

struct PokemonDto: Codable {
    let name: String
    let url: String
    
}

struct PokemonResponseDto: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PokemonDto]
}


let pokemonApiUrl = "https://pokeapi.co/api/v2/pokemon"

func getPokemon() -> [Pokemon] {
    let chikorita = Pokemon(species: "Chikorita", id: 152)
    let bulbasaur = Pokemon(species: "Bulbasaur", id: 1)
    let pokemonList: [Pokemon] = [chikorita, bulbasaur]
    return pokemonList
}

struct ContentView: View {
    @State var pokemonList = [Pokemon]()
    var body: some View {
        List(pokemonList, id: \.id) { pokemon in
            PokemonView(species: pokemon.species, id: pokemon.id, url: pokemon.imgUrl
            )
        }
        Button("Button title") {
            pokemonList = getPokemon()
            
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
