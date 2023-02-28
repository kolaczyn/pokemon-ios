import SwiftUI


struct ContentView: View {
    @State var pokemonResponseDto: PokemonResponseDto? = nil
    var body: some View {
        PokemonListView(pokemonDto: pokemonResponseDto?.results ?? [])
            .onAppear(perform: loadData)
    }
    func loadData() {
        fetchPokemon( { result in
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
