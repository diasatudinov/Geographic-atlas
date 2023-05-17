//
//  CountryDetailService.swift
//  Geographic atlas
//
//  Created by Atudinov Dias on 17.05.2023.
//

import Foundation

class ServiceCountryDetail{
    func getCountryDetails(cca2: String) async throws -> [CountryDetails]{
        guard let url = URL(string: "https://restcountries.com/v3.1/alpha/\(cca2)") else {
            throw NetworkError.badURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let response = try JSONDecoder().decode(CountryDetailsResponse.self, from: data)
        return response.countriesDetails
    }
}
