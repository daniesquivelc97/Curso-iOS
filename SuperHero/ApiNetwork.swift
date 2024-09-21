//
//  ApiNetwork.swift
//  CursoiOS
//
//  Created by Daniel Alejandro Esquivel Correa on 21/09/24.
//

import Foundation

class ApiNetwork {
    
    func getHeroesByQuery(query: String) async throws -> Wrapper {
       let url = URL(string: "https://superheroapi.com/api/7a9af129eda0c3a35bb4924819116513/search/\(query)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        return wrapper
    }
}
