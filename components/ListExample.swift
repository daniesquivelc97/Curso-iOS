//
//  ListExample.swift
//  CursoiOS
//
//  Created by Daniel Alejandro Esquivel Correa on 21/09/24.
//

import SwiftUI

var pokemons = [
    Pokemon(name: "Pikachu"),
    Pokemon(name: "Charmander"),
    Pokemon(name: "Charmilon"),
    Pokemon(name: "Charizard"),
    Pokemon(name: "Square"),
]

var digimons = [
    Digimon(name: "Agumon"),
    Digimon(name: "Graymon"),
    Digimon(name: "DanielMon"),
    Digimon(name: "DanielMon"),
    Digimon(name: "Otro"),
]

struct ListExample: View {
    var body: some View {
        List{
            Section(header: Text("Pokemons")) {
                ForEach(pokemons, id: \.name) {pokemon in
                    Text(pokemon.name)
                }
            }
            Section(header: Text("Digimons")) {
                ForEach(digimons) {digimon in
                    Text(digimon.name)
                }
            }
        }.listStyle(.automatic)
        
//        List{
//            ForEach(pokemons, id: \.name) {pokemon in
//                Text(pokemon.name)
//            }
//        }
//        
//        List(digimons) {digimon in
//            Text(digimon.name)
//        }
    }
}

struct Pokemon {
    let name: String
}

struct Digimon: Identifiable {
    var id = UUID()
    let name: String
}

#Preview {
    ListExample()
}
