//
//  RowUIView.swift
//  Geographic atlas
//
//  Created by Atudinov Dias on 15.05.2023.
//

import Foundation
import SwiftUI

struct RowView: View {
    @State public var isExpanded = false
    @State private var rotationAngle: Double = 0
    let countryName:String
    let capital:String
    let flagUrl: String
    var body: some View {
        GeometryReader { geometry in
            HStack {
                AsyncImage(url: URL(string: flagUrl)!,
                           placeholder: { Text("Loading ...") },
                           image: { Image(uiImage: $0).resizable() })
                .scaledToFit()
                .frame(width: 82, height:48)
                .cornerRadius(8)
                .padding(.all, 12.0)
                VStack{
                    Text(countryName)
                        .font(.system(size: 17).bold())
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom,2/3)
                        .padding(.top, 16.0)
                    Text(capital)
                        .font(.system(size: 13))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color("capitalColor"))
                        .padding(.bottom, 16.0)
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color("CellBackground"))
            
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(countryName: "Kazakhstan", capital: "Astana", flagUrl: "https://flagcdn.com/w320/kz.png")
    }
}
