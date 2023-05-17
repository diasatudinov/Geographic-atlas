//
//  Country.swift
//  Geographic atlas
//
//  Created by Atudinov Dias on 14.05.2023.
//

import Foundation

struct CountryResponse: Decodable {
    var countries: [Country]
    init(from decoder: Decoder) throws {
        var countries = [Country]()
        var container = try decoder.unkeyedContainer()
        while !container.isAtEnd {
            if let route = try? container.decode(Country.self){
                countries.append(route)
                
            } else {
                _ = try? container.decode(DummyData.self)
            }
        }
        self.countries = countries
    }
}

private struct DummyData: Decodable { }

struct Country: Hashable,Decodable{
    var name: NameData
    var capital: [String]
    var flags: FlagData
    var population: Int
    var currencies: [String:Currencies]
    var area: Int
    var cca2: String
    var region: String
    var subregion: String
}


struct FlagData: Hashable,Decodable {
    var png: String
}

struct NameData: Hashable,Decodable {
    var common: String
    var official: String
}

struct Currencies: Hashable,Decodable {
    var name: String
    var symbol: String
}
