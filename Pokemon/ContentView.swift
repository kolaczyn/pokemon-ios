import SwiftUI

func getPokemonUrl(_ name: String) -> String {
    return "https://bulbapedia.bulbagarden.net/wiki/\(name)"
}

struct OtherScreenView: View {
    let pokemon: PokemonDto
    var body: some View {
        VStack {
            PokemonView(species: pokemon.name, id: pokemon.id, url: pokemon.imgUrl)
            Link("Visit me on Bulbapedia", destination: URL(string: getPokemonUrl(pokemon.name))!)

        }
    }
}

struct ContentView: View {
    @State var pokemonResponseDto: PokemonResponseDto? = nil
    var body: some View {
        NavigationView(content: {
            VStack {
                Text("Pokemon List")
                List(pokemonResponseDto?.results ?? [], id: \.id) { pokemon in
                    NavigationLink(destination: OtherScreenView(pokemon: pokemon)) {
                        PokemonView(species: pokemon.name, id: pokemon.id, url: pokemon.imgUrl
                        )
                    }
                }
            }
            .onAppear(perform: loadData)
        })
    }
    
    func loadData() {
        fetchPokemon( { result in
            print(result)
            switch result {
            case .success(let response):
                self.pokemonResponseDto = response
            case .failure(let fail):
                print(fail.localizedDescription)
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
