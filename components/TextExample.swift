//
//  TextExample.swift
//  CursoiOS
//
//  Created by Daniel Alejandro Esquivel Correa on 24/08/24.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).font(.headline)
        Text("Custom").font(.system(size: 50, weight: .light, design: .monospaced))
            .italic()
            .bold()
            .underline()
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .background(.red)
        Text("Daniel Daniel Daniel Daniel Daniel").frame(width: 150).lineLimit(3).lineSpacing(25)
    }
}

#Preview {
    TextExample()
}
