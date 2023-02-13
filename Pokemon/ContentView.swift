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

struct PokemonDto: Codable, Identifiable {
    let name: String
    let url: String
    var id: String { name }
    var imgUrl: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png"
    }
    
}

struct PokemonResponseDto: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PokemonDto]
}

struct ContentView: View {
    @State var pokemonResponseDto: PokemonResponseDto? = nil
    var body: some View {
        List(pokemonResponseDto?.results ?? [], id: \.id) { pokemon in
            PokemonView(species: pokemon.name, id: 69, url: pokemon.imgUrl
            )
        }.onAppear(perform: loadData)
    }
    func loadData() {
        let pokemonApiUrl = "https://pokeapi.co/api/v2/pokemon"
        let url = URL(string: pokemonApiUrl)!
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(PokemonResponseDto.self, from: data) {
                    DispatchQueue.main.async {
                        self.pokemonResponseDto = response
                    }
                    return
                }
            }
        }.resume()
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
