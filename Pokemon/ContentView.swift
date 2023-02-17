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
