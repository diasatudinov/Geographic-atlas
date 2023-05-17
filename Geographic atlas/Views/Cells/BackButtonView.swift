//
//  BackButtonView.swift
//  Geographic atlas
//
//  Created by Atudinov Dias on 17.05.2023.
//

import SwiftUI

struct BackButtonView: View {
    @Environment(\.presentationMode) var presentionMode: Binding
    var body: some View {
        Button {
            self.presentionMode.wrappedValue.dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.backward")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color(.systemBlue))
            }
        }

       
    }
}

struct BackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonView()
    }
}
