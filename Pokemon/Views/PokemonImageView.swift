//
//  PokemonImageView.swift
//  Pokemon
//
//  Created by Paweł Kołaczyński on 17/02/2023.
//

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
