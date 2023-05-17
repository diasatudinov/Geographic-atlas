//
//  ViewModelCountryDetail.swift
//  Geographic atlas
//
//  Created by Atudinov Dias on 17.05.2023.
//

import SwiftUI

@MainActor class ViewModelCountryDetail: ObservableObject, Identifiable{
    @Published var countriesDetails: [CountryDetails] = []
    func useCountryDetail(cca2: String) async {
        do{
            let countryDetails = try await ServiceCountryDetail().getCountryDetails(cca2: cca2)
            self.countriesDetails = countryDetails
            
        } catch {
            print(error)
        }
    }
}

