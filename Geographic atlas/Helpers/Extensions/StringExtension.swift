//
//  StringExtension.swift
//  Geographic atlas
//
//  Created by Atudinov Dias on 17.05.2023.
//

import Foundation

extension String: Identifiable {
    public typealias ID = Int
    public var id: Int {
        return hash
    }
}
