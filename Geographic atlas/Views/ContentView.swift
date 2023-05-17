//
//  ContentView.swift
//  Geographic atlas
//
//  Created by Atudinov Dias on 14.05.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    @State private var isOpened = false
    var body: some View {
        GeometryReader{ geometry in
            NavigationView{
                ScrollView{
                    VStack{
                        ForEach(viewModel.countries, id: \.self){ country in
                            VStack{
                                DisclosureGroup (){
                                    FullInfoView(population: country.population, area: country.area, currencyName: country.currencies.first?.value.name ?? "", currencySymbol: country.currencies.first?.value.symbol ?? "", currencyKey: country.currencies.first?.key ?? "" ,cca2: country.cca2)
                                        .frame(height: 170)
                                        .padding(.trailing,19)
                                        .tint(Color(.systemBlue))
                                        
                                } label: {
                                    RowView(countryName: "\(country.name.common)", capital: "\(country.capital.joined(separator: ","))", flagUrl: "\(country.flags.png)")
                                        .frame(height: 70)
                                    
                                }.cornerRadius(12, corners: .allCorners)
                                    .tint(.black)
                                
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .task{
                        await viewModel.useCountry()
                    }
                }
                .frame(width: geometry.size.width)
                .navigationTitle("World countries")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


