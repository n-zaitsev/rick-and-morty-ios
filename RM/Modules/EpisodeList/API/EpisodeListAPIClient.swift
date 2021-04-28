//
//  EpisodeListAPIClient.swift
//  RM
//
//  Created by Импрув on 28.04.2021.
//

import Alamofire
import Foundation

class EpisodeListAPIClient {
    @discardableResult
    private static func performRequest<T: Decodable>(route: EpisodeListEndpoint, decoder: JSONDecoder = JSONDecoder(), completion: @escaping (Result<T, AFError>) -> Void) -> DataRequest {
        return AF.request(route)
            .responseDecodable(decoder: decoder) { (response: DataResponse<T, AFError>) in
                completion(response.result)
            }
    }

    static func getEpisodesWithIds(_ ids: [String], completion: @escaping (Result<EpisodesResponse, AFError>) -> Void) {
        performRequest(route: EpisodeListEndpoint.getEpisodesWitdIds(ids), completion: completion)
    }

    static func getEpisodeWithId(_ id: String, completion: @escaping (Result<Episode, AFError>) -> Void) {
        performRequest(route: EpisodeListEndpoint.getEpisodeWithId(id), completion: completion)
    }

//    static func getCharactersIdsWithEpisode(_ episode: String, completion: @escaping (Result<[String], AFError>) -> Void) {
//        performRequest(route: CharacterEndpoint.getCharactersIdsWithEpisode(episode), completion: completion)
//    }
//
//    static func getCharactersWithIds(_ ids: [String], completion: @escaping (Result<[Character], AFError>) -> Void) {
//        performRequest(route: CharacterEndpoint.getCharactersWithIds(ids), completion: completion)
//    }
}
