//
//  MenuView.swift
//  CursoiOS
//
//  Created by Daniel Alejandro Esquivel Correa on 25/08/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: IMCView()){
                    Text("IMC Calculator")
                }

                NavigationLink(destination: SuperHeroSearcher()){
                    Text("Super hero app")
                }
                Text("App 3")
                Text("App 4")
                Text("App 5")
            }
        }
    }
}

#Preview {
    MenuView()
}
