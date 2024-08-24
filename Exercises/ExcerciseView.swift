//
//  ContentView.swift
//  CursoiOS
//
//  Created by Daniel Alejandro Esquivel Correa on 24/08/24.
//

import SwiftUI

struct ExcerciseView: View {
    @State private var vibrateOnRing = false
    var body: some View {
        VStack {
            HStack {
                Rectangle().foregroundColor(.blue)
                Rectangle().foregroundColor(.orange)
                Rectangle().foregroundColor(.yellow)
                
            }.frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            Rectangle().foregroundColor(.orange).frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            HStack {
                Circle().foregroundColor(.green)
                Rectangle().foregroundColor(.black)
                Circle().foregroundColor(.indigo)
            }.frame(height: 250)
            Rectangle().foregroundColor(.orange).frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            HStack {
                Rectangle().foregroundColor(.blue)
                    .frame(height: 100)
                Rectangle().foregroundColor(.orange).frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                Rectangle().foregroundColor(.yellow)
                    .frame(height: 100)
            }
            
        }
        .background(.red)
    }
}

#Preview {
    ExcerciseView()
}
