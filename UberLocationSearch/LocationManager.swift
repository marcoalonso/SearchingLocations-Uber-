//
//  LocationManager.swift
//  UberLocationSearch
//
//  Created by marco alonso on 19/01/21.
//

import Foundation
import CoreLocation

struct Location {
    let title: String
    let coordinates: CLLocationCoordinate2D?
}

class LocationManager: NSObject {
    static let shared = LocationManager()
    
    let manager = CLLocationManager()
    
    public func findLocations(with query: String, completion: @escaping (([Location]) -> Void )) {
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(query) { places, error in
            guard let places = places, error == nil else {
                completion([])
                return
            }
            let models: [Location] =  places.compactMap({ place in
                var name = ""
                if let locationName = place.name {
                    name += locationName
                }
                let result = Location(
                    title: name,
                    coordinates: place.location?.coordinate
                )
                
                return result
            })
        }
        
    }
}
