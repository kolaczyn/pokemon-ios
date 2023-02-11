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
    let url: String
}

func getPokemon() -> [Pokemon] {
    let chikorita = Pokemon(species: "Chikorita", id: 152, url:"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/152.png")
    let bulbasaur = Pokemon(species: "Bulbasaur", id: 1, url:"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png")
    let pokemonList: [Pokemon] = [chikorita, bulbasaur]
    return pokemonList
}

struct ContentView: View {
    var pokemonList = getPokemon()
    var body: some View {
        List(pokemonList, id: \.id) { pokemon in
            PokemonView(species: pokemon.species, id: pokemon.id, url: pokemon.url
            )
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
