//
//  CountryDetailModel.swift
//  Geographic atlas
//
//  Created by Atudinov Dias on 17.05.2023.
//

import Foundation

struct CountryDetailsResponse: Decodable {
    var countriesDetails: [CountryDetails]
    init(from decoder: Decoder) throws {
        var countriesDetails = [CountryDetails]()
        var container1 = try decoder.unkeyedContainer()
        while !container1.isAtEnd {
            if let route1 = try? container1.decode(CountryDetails.self){
                countriesDetails.append(route1)
                
            } else {
                _ = try? container1.decode(DummyDataCountryDetails.self)
            }
        }
        self.countriesDetails = countriesDetails
    }
}

private struct DummyDataCountryDetails: Decodable { }

struct CountryDetails: Hashable,Decodable{
    let flags: FlagDataDetails //
    let subregion: String //
    let name: NameDataDetails//
    let capital: [String]//
    let capitalInfo: CapitalInfo//
    let population: Int//
    let area: Int//
    let currencies: [String:CurrenciesDetails]
    let timezones: [String]
    let maps: Maps
}

struct Maps: Hashable,Decodable {
    let openStreetMaps: String
    
}

struct FlagDataDetails: Hashable,Decodable {
    let png: String
}

struct NameDataDetails: Hashable,Decodable {
    let common: String
    let official: String
}

struct CapitalInfo: Hashable,Decodable {
    let latlng: [Double]
}

struct CurrenciesDetails: Hashable,Decodable {
    var name: String
    var symbol: String
}
