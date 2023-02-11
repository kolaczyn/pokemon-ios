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

struct ContentView: View {
    var body: some View {
        VStack {
            PokemonView(species: "Chickorita", id: 152,
                        url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/152.png"
            )
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
