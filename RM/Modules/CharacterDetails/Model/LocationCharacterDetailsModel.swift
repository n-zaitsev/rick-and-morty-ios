//
//  LocationCharacterDetailsModel.swift
//  RM
//
//  Created by Импрув on 23.04.2021.
//

import Foundation

class LocationCharacterDetailsModel: NSObject, LocationCellConfigurator {
    let name: String
    let headerName: String
    let locationId: String

    init(location: CharacterLocation, headerName: String) {
        self.headerName = headerName
        name = location.name
        locationId = location.url.getCharacterIdFromUrl()
    }
}
