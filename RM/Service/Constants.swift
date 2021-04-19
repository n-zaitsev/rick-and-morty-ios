//
//  Constants.swift
//  RM
//
//  Created by Импрув on 19.04.2021.
//

import Foundation

struct RequestURLs {
    static let baseURL = "https://rickandmortyapi.com/api/?"
    static let characters = "character/"
    static let locations = "location/"
    static let episodes = "episode/"
}

enum RequestParams {
    enum characters {
        public static let page = "page"
    }
}
