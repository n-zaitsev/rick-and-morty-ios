//
//  CharacterAPIClient.swift
//  RM
//
//  Created by Импрув on 19.04.2021.
//

import Alamofire
import Foundation

class CharacterAPIClient {
    @discardableResult
    private static func performRequest<T: Decodable>(route: CharacterEndpoint, decoder: JSONDecoder = JSONDecoder(), completion: @escaping (Result<T, AFError>) -> Void) -> DataRequest {
        return AF.request(route)
            .responseDecodable(decoder: decoder) { (response: DataResponse<T, AFError>) in
                completion(response.result)
            }
    }

    static func getCharactersWithPage(_ page: String?, completion: @escaping (Result<CharactersResponse, AFError>) -> Void) {
        performRequest(route: CharacterEndpoint.getCharactersWithPage(page), completion: completion)
    }

    static func getCharactersIdsWithEpisode(_ episode: String, completion: @escaping (Result<[String], AFError>) -> Void) {
        performRequest(route: CharacterEndpoint.getCharactersIdsWithEpisode(episode), completion: completion)
    }

    static func getCharactersWithIds(_ ids: [String], completion: @escaping (Result<[Character], AFError>) -> Void) {
        performRequest(route: CharacterEndpoint.getCharactersWithIds(ids), completion: completion)
    }
}
