//
//  DegreeDecimalMinutes.swift
//  Geographic atlas
//
//  Created by Atudinov Dias on 17.05.2023.
//

import Foundation
import LocationFormatter
import CoreLocation

func convertToDegrees(lat: Double, lon: Double) -> String{
    let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
    let formatter = LocationCoordinateFormatter()
    formatter.format = .degreesDecimalMinutes
    guard let format = formatter.string(from: coordinate) else {
        
        return ""
        
    }
    return format
}
