//
//  AboutView.swift
//  Pokemon
//
//  Created by Paweł Kołaczyński on 18/02/2023.
//

import SwiftUI

struct AboutView: View {
    @EnvironmentObject var counter: Counter;
    var body: some View {
        VStack {
            Text("Created by Paweł Kołaczyński in 2023")
            Button("Counter at \(counter.value)", action: {
                counter.value += 1
            })
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
