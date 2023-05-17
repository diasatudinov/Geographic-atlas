//
//  FullInfoView.swift
//  Geographic atlas
//
//  Created by Atudinov Dias on 16.05.2023.
//

import SwiftUI

struct FullInfoView: View {
    @StateObject private var viewModelDetails = ViewModelCountryDetail()
    let population: Int
    let area: Int
    let currencyName: String
    let currencySymbol: String
    let currencyKey: String
    let cca2: String
    
    var body: some View {
        VStack{
            HStack {
                Text("Population:")
                    .font(.system(size: 13))
                    .frame(alignment: .leading)
                    .foregroundColor(Color("capitalColor"))
                    .padding([.leading], 12.0)
                Text("\(population)")
                    .font(.system(size: 15))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.black)
            }.padding(.top,12)
            HStack {
                Text("Area:")
                    .font(.system(size: 13))
                    .frame(alignment: .leading)
                    .foregroundColor(Color("capitalColor"))
                    .padding([.leading], 12.0)
                Text("\(area) km\u{00B2}")
                    .font(.system(size: 15))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.black)
            }.padding([.top,.bottom],8)
            HStack {
                Text("Currencies:")
                    .font(.system(size: 13))
                    .frame(alignment: .leading)
                    .foregroundColor(Color("capitalColor"))
                    .padding([.leading], 12.0)
                Text("\(currencyName) (\(currencySymbol)) (\(currencyKey))")
                    .font(.system(size: 15))
                    .lineLimit(3)
                    .frame(maxWidth: 200, alignment: .leading)
                    .foregroundColor(.black)
                Spacer()
            }
            NavigationLink(destination:
                            CountryDetailsUIView(cca2: cca2).frame(height: 750))
            {
                Text("Learn more")
            }.padding([.top,.bottom],17)
                .navigationTitle("World countries")
            Spacer()
        }
        .frame(maxWidth: 400)
        .frame(alignment: .leading)
        .background(Color("CellBackground"))
        
    }
}


struct FullInfoView_Previews: PreviewProvider {
    static var previews: some View {
        FullInfoView(population: 1000000, area: 5000000, currencyName: "Tenge", currencySymbol: "T", currencyKey: "KZT", cca2: "VUV")
    }
}



