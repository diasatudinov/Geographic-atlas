//
//  Service.swift
//  Geographic atlas
//
//  Created by Atudinov Dias on 14.05.2023.
//

import Foundation

class Service{
    func getCountry() async throws -> [Country]{
        guard let url = URL(string: "https://restcountries.com/v3.1/all") else {
            throw NetworkError.badURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let response = try JSONDecoder().decode(CountryResponse.self, from: data)
        return response.countries
    }
}
