//
//  String+getCharacterIdFromUrl.swift
//  RM
//
//  Created by Импрув on 27.04.2021.
//

import Foundation

extension String {
    func getCharacterIdFromUrl() -> String {
        if let characterId = split(separator: "/").last {
            return String(characterId)
        }
        return ""
    }
}
