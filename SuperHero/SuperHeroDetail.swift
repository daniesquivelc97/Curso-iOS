//
//  SuperHeroDetail.swift
//  CursoiOS
//
//  Created by Daniel Alejandro Esquivel Correa on 22/09/24.
//

import SwiftUI
import SDWebImageSwiftUI
import Charts

struct SuperHeroDetail: View {
    let id: String
    @State var superhero: SuperHeroComplete? = nil
    @State var loading: Bool = true
    var body: some View {
        VStack{
            if loading {
                ProgressView().tint(.white)
            } else if let superhero = superhero {
                WebImage(url: URL(string: superhero.image.url))
                    .resizable()
                    .scaledToFill()
                    .frame(maxHeight: 250)
                    .clipped()
                Text(superhero.name).bold().font(.title).foregroundColor(.white)
                ForEach(superhero.biography.aliases, id: \.self) { alias in
                    Text(alias).foregroundColor(.gray)
                }
                SuperheroStats(stats: superhero.powerstats)
                Spacer()
            }
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity).background(.backgroundApp).onAppear{
            Task {
                do {
                    superhero = try await ApiNetwork().getHeroById(id: id)
                } catch {
                    
                }
                loading = false
            }
        }
    }
}

struct SuperheroStats: View {
    let stats: Powerstats
    var body: some View {
        VStack {
            Chart {
                SectorMark(angle: .value("Count", Int(stats.combat) ?? 0),
                           innerRadius: .ratio(0.6),
                           angularInset: 5
                ).cornerRadius(10)
                    .foregroundStyle(by: .value("Category", "Combat"))
                SectorMark(angle: .value("Count", Int(stats.durability) ?? 0),
                           innerRadius: .ratio(0.6),
                           angularInset: 5
                ).cornerRadius(10)
                    .foregroundStyle(by: .value("Category", "Durability"))
                SectorMark(angle: .value("Count", Int(stats.power) ?? 0),
                           innerRadius: .ratio(0.6),
                           angularInset: 5
                ).cornerRadius(10)
                    .foregroundStyle(by: .value("Category", "Power"))
                SectorMark(angle: .value("Count", Int(stats.speed) ?? 0),
                           innerRadius: .ratio(0.6),
                           angularInset: 5
                ).cornerRadius(10)
                    .foregroundStyle(by: .value("Category", "Speed"))
                SectorMark(angle: .value("Count", Int(stats.strength) ?? 0),
                           innerRadius: .ratio(0.6),
                           angularInset: 5
                ).cornerRadius(10)
                    .foregroundStyle(by: .value("Category", "Strength"))
            }
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 350)
            .background(.white)
            .cornerRadius(16)
            .padding(32)
    }
}

#Preview {
    SuperHeroDetail(id: "17")
}
