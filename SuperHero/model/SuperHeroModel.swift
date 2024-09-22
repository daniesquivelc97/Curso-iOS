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

struct SuperHeroComplete: Codable {
    let id: String
    let name: String
    let image: SuperHeroImage
    let powerstats: Powerstats
    let biography: Biography
}

struct Powerstats: Codable {
    let intelligence, strength, speed, durability: String
    let power, combat: String
}

struct Biography: Codable {
    let fullName: String
    let aliases: [String]
    let publisher, alignment: String

    enum CodingKeys: String, CodingKey {
        case fullName = "full-name"
        case aliases
        case publisher, alignment
    }
}
