//
//  LabelExample.swift
//  CursoiOS
//
//  Created by Daniel Alejandro Esquivel Correa on 24/08/24.
//

import SwiftUI

struct LabelExample: View {
    var body: some View {
        Label("Subscribete", image: "icon")
        Label("Subscribete", systemImage: "figure.badminton")
        Label(title: {Text("Label")}, icon: {Image("icon")
                .resizable()
                .scaledToFit()
                .frame(height: 30)
        })
    }
}

#Preview {
    LabelExample()
}
