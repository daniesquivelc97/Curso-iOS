//
//  ImageExample.swift
//  CursoiOS
//
//  Created by Daniel Alejandro Esquivel Correa on 24/08/24.
//

import SwiftUI

struct ImageExample: View {
    var body: some View {
        Image("icon")
            .resizable()
            .scaledToFill()
            .frame(width: 50, height: 90)
        Image(systemName: "figure.walk").resizable()
    }
}

#Preview {
    ImageExample()
}
