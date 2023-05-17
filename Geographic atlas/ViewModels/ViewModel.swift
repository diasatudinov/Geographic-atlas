//
//  viewModel.swift
//  Geographic atlas
//
//  Created by Atudinov Dias on 14.05.2023.
//ViewModel of Countries List

import SwiftUI

@MainActor class ViewModel: ObservableObject, Identifiable{
    @Published var countries: [Country] = []
    @Published var countriesDetails: [CountryDetails] = []
    func useCountry() async {
        do{
            let country = try await Service().getCountry()
            self.countries = country
            
        } catch {
            print(error)
        }
    }
}

