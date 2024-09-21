//
//  SuperHeroModel.swift
//  CursoiOS
//
//  Created by Daniel Alejandro Esquivel Correa on 21/09/24.
//

import Foundation

struct Wrapper: Codable {
    let response: String
    let results: [SuperHero]
}

struct SuperHero: Codable, Identifiable {
    let id: String
    let name: String
    let image: SuperHeroImage
}

struct SuperHeroImage: Codable{
    let url: String
}
