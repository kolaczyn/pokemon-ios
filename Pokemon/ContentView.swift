import SwiftUI


struct ContentView: View {
    @State var pokemonResponseDto: PokemonResponseDto? = nil
    @EnvironmentObject var counter: Counter
    var body: some View {
        NavigationView(content: {
            VStack {
                Button("Counter at \(counter.value)",
                       action: {
                    counter.value += 1
                })
                PokemonListView(pokemonDto: pokemonResponseDto?.results ?? [])
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
