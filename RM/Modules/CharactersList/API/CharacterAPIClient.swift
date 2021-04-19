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

    static func getCharactersWithPage(_ page: String, completion: @escaping (Result<CharactersResponce, AFError>) -> Void) {
        performRequest(route: CharacterEndpoint.getCharactersWithPage(page), completion: completion)
    }
}
