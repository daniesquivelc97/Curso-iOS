//
//  SuperHeroSearcher.swift
//  CursoiOS
//
//  Created by Daniel Alejandro Esquivel Correa on 21/09/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct SuperHeroSearcher: View {
    @State var superHeroName: String = ""
    @State var wrapper: Wrapper? = nil
    @State var loading: Bool = false
    var body: some View {
        VStack {
            TextField("", text: $superHeroName, prompt: Text("Superman...").foregroundColor(.gray))
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding(16)
                .border(.purple, width: 1.5)
                .padding(8)
                .autocorrectionDisabled()
                .onSubmit {
                    loading = true
                    Task {
                        do {
                            wrapper = try await ApiNetwork().getHeroesByQuery(query: superHeroName)
                        } catch let error as URLError {
                            print("URLError: \(error.localizedDescription)")
                        }
                        catch {
                            print("Unexpected error: \(error)")
                        }
                        loading = false
                    }
                    
                    
                }
            if loading {
                ProgressView().tint(.white)
            }
            NavigationStack {
                List(wrapper?.results ?? []) {superhero in
                    ZStack{
                        SuperheroItem(superhero: superhero)
                        NavigationLink(destination: {}) {
                            EmptyView()
                        }.opacity(0)
                    }.listRowBackground(Color.backgroundApp)
                }.listStyle(.plain)
            }
            Spacer()
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity).background(.backgroundApp)
    }
}

struct SuperheroItem: View {
    let superhero: SuperHero
    var body: some View {
        ZStack {
            WebImage(url: URL(string: superhero.image.url))
                .resizable()
                .indicator(.activity)
                .scaledToFill()
                .frame(height: 200)
            VStack {
                Spacer()
                Text(superhero.name).foregroundColor(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(.white.opacity(0.5))
            }
        }.frame(height: 200).cornerRadius(32)
    }
}
#Preview {
    SuperHeroSearcher()
}
