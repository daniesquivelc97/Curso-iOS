//
//  ButtonExample.swift
//  CursoiOS
//
//  Created by Daniel Alejandro Esquivel Correa on 24/08/24.
//

import SwiftUI

struct ButtonExample: View {
    var body: some View {
        Button("Hola") {
            print("Click")
        }
        Button(action: {print("Hola")}, label: {
            Text("Hoola")
                .frame(width: 100, height: 50)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
        })
    }
}

struct Counter: View {
    @State var subscribersNumber = 0
    var body: some View {
        Button(action: {
            subscribersNumber += 1
        },
               label: {
            Text("Suscriptores: \(subscribersNumber)")
                .bold()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .frame(height: 50)
                .foregroundColor(.white)
                .background(.red)
                .cornerRadius(10)
        })
    }
}

#Preview {
    Counter()
}
