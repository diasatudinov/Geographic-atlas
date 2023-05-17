//
//  ViewExtension.swift
//  Geographic atlas
//
//  Created by Atudinov Dias on 17.05.2023.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
