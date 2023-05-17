//
//  CountryDetailsUIView.swift
//  Geographic atlas
//
//  Created by Atudinov Dias on 16.05.2023.
//

import SwiftUI

struct CountryDetailsUIView: View {
    @StateObject private var viewModelCountryDetails = ViewModelCountryDetail()
    let cca2: String
    var body: some View {
        ScrollView{
            VStack{
                if let flagUrl = viewModelCountryDetails.countriesDetails.first?.flags.png{
                    AsyncImage(url: URL(string: flagUrl)!,
                                        placeholder: { Text("Loading ...") },
                                        image: { Image(uiImage: $0).resizable() })
                        .scaledToFit()
                        .frame(width: 343, height:193)
                        .cornerRadius(8)
                        .padding(.all, 16.0)
                }
                HStack{
                    VStack{
                        Circle()
                            .fill(.black)
                            .frame(width: 24, height: 10)
                            .padding(.top, 13)
                        Spacer()
                    }.frame(height: 46)
                    VStack(spacing: 4){
                        Text("Region:")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color("capitalColor"))
                            .font(.system(size:15))
                        Text(viewModelCountryDetails.countriesDetails.first?.subregion ?? "")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size:20))
                    }
                }.padding(.leading,16)
                HStack{
                    VStack{
                        Circle()
                            .fill(.black)
                            .frame(width: 24, height: 10)
                            .padding(.top, 13)
                        Spacer()
                    }.frame(height: 46)
                    VStack(spacing: 4){
                        Text("Capital:")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color("capitalColor"))
                            .font(.system(size:15))
                        Text(viewModelCountryDetails.countriesDetails.first?.capital.joined(separator: ",") ?? "")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size:20))
                    }
                }.padding(.leading,16)
                HStack{
                    VStack{
                        Circle()
                            .fill(.black)
                            .frame(width: 24, height: 10)
                            .padding(.top, 13)
                        Spacer()
                    }.frame(height: 46)
                    VStack(spacing: 4){
                        Text("Capital coordinates:")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color("capitalColor"))
                            .font(.system(size:15))
                        Button {
                            if let url = viewModelCountryDetails.countriesDetails.first?.maps.openStreetMaps{
                                UIApplication.shared.openURL(NSURL(string: url)! as URL)
                            }
                            
                        } label: {
                            Text(convertToDegrees(lat: (viewModelCountryDetails.countriesDetails.first?.capitalInfo.latlng[0] ?? 5.0000), lon: (viewModelCountryDetails.countriesDetails.first?.capitalInfo.latlng[1] ?? 5.0000)))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size:20))
                        }
                    }
                }.padding(.leading,16)
                HStack{
                    VStack{
                        Circle()
                            .fill(.black)
                            .frame(width: 24, height: 10)
                            .padding(.top, 13)
                        Spacer()
                    }.frame(height: 46)
                    VStack(spacing: 4){
                        Text("Population:")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color("capitalColor"))
                            .font(.system(size:15))
                        Text("\(viewModelCountryDetails.countriesDetails.first?.population ?? 0)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size:20))
                    }
                }.padding(.leading,16)
                HStack{
                    VStack{
                        Circle()
                            .fill(.black)
                            .frame(width: 24, height: 10)
                            .padding(.top, 13)
                        Spacer()
                    }.frame(height: 46)
                    VStack(spacing: 4){
                        Text("Area:")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color("capitalColor"))
                            .font(.system(size:15))
                        Text("\(viewModelCountryDetails.countriesDetails.first?.area ?? 0) km\u{00B2}")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size:20))
                    }
                }.padding(.leading,16)
                HStack{
                    Circle()
                        .fill(.black)
                        .frame(width: 24, height: 10)
                    VStack(spacing: 4){
                        Text("Currency:")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color("capitalColor"))
                            .font(.system(size:15))
                        Text("\(viewModelCountryDetails.countriesDetails.first?.currencies.first?.value.name ?? "") ( \(viewModelCountryDetails.countriesDetails.first?.currencies.first?.value.symbol ?? ""))  (\(viewModelCountryDetails.countriesDetails.first?.currencies.first?.key ?? ""))")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size:20))
                    }
                }.padding(.leading,16)
                HStack{
                    VStack{
                        Circle()
                            .fill(.black)
                            .frame(width: 24, height: 10)
                            .padding(.top, 13)
                        Spacer()
                    }.frame(height: 46)
                    VStack(spacing: 4){
                        Text("Timezones:")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color("capitalColor"))
                            .font(.system(size:15))
                        if let timeCount = viewModelCountryDetails.countriesDetails.first?.timezones.count {
                            ForEach(0..<timeCount){ i in
                                Text(viewModelCountryDetails.countriesDetails.first?.timezones[i] ?? "")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.system(size:20))
                            }
                        }
                    }
                }.padding(.leading,16)
                
            }
            .padding(.top,45)
            .task{
                await viewModelCountryDetails.useCountryDetail(cca2: cca2)
            }
        }
        .navigationTitle("\(viewModelCountryDetails.countriesDetails.first?.name.common ?? "Name")")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButtonView())
    }
}

struct CountryDetailsUIView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailsUIView(cca2: "FR")
    }
}
