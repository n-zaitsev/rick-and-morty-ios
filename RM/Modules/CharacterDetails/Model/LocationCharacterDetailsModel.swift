//
//  LocationCharacterDetailsModel.swift
//  RM
//
//  Created by Импрув on 23.04.2021.
//

import Foundation

class LocationCharacterDetailsModel: NSObject, LocationCellConfigurator {
    let name: String
    let locationId: String

    init(location: Location) {
        name = location.name
        locationId = (location.url.split(separator: "/").last != nil) ? String(location.url.split(separator: "/").last!) : " "
    }
}