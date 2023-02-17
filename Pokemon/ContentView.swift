import SwiftUI


struct ContentView: View {
    @State var pokemonResponseDto: PokemonResponseDto? = nil
    var body: some View {
        List(pokemonResponseDto?.results ?? [], id: \.id) { pokemon in
            PokemonView(species: pokemon.name, id: pokemon.id, url: pokemon.imgUrl
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
