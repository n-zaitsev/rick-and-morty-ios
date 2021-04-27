//
//  CharacterDeatilsAPIClient.swift
//  RM
//
//  Created by Импрув on 23.04.2021.
//

import Alamofire
import Foundation

class CharacterDetailsAPIClient {
    @discardableResult
    private static func performRequest<T: Decodable>(route: CharacterDetailsEndpoint, decoder: JSONDecoder = JSONDecoder(), completion: @escaping (Result<T, AFError>) -> Void) -> DataRequest {
        return AF.request(route)
            .responseDecodable(decoder: decoder) { (response: DataResponse<T, AFError>) in
                completion(response.result)
            }
    }

    static func getCharacterWithId(_ id: String, completion: @escaping (Result<Character, AFError>) -> Void) {
        performRequest(route: CharacterDetailsEndpoint.getCharacterWithId(id), completion: completion)
    }

    static func getEpisodesWithIds(_ ids: [String], completion: @escaping (Result<EpisodesResponse, AFError>) -> Void) {
        performRequest(route: CharacterDetailsEndpoint.getEpisodesWitdIds(ids), completion: completion)
    }

    static func getEpisodeWithId(_ id: String, completion: @escaping (Result<Episode, AFError>) -> Void) {
        performRequest(route: CharacterDetailsEndpoint.getEpisodeWithId(id), completion: completion)
    }

    static func getLocationWithId(_ id: String, completion: @escaping (Result<Location, AFError>) -> Void) {
        performRequest(route: CharacterDetailsEndpoint.getLocationWithId(id), completion: completion)
    }
}
