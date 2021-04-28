//
//  EpisodeListEndpoint.swift
//  RM
//
//  Created by Импрув on 28.04.2021.
//

import Alamofire
import Foundation

enum EpisodeListEndpoint: APIConfiguration {
//    case getCharactersIdsWithEpisode(_ episode: String)
    case getEpisodesWitdIds(_ ids: [String])
    case getEpisodeWithId(_ id: String)

    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }

    var path: String {
        switch self {
        case let .getEpisodesWitdIds(ids):
            return RequestURLs.episodes + "\(ids)"
        case let .getEpisodeWithId(id):
            return RequestURLs.episodes + id
        }
    }

    var parameters: Params? {
        switch self {
        default:
            return nil
        }
    }

    func asURLRequest() throws -> URLRequest {
        let url = try RequestURLs.baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        // Parameters
        switch parameters {
        case let .body(params):
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])

        case let .url(params):
            let queryParams = params.map { pair in
                URLQueryItem(name: pair.key, value: "\(pair.value)")
            }
            var components = URLComponents(string: url.appendingPathComponent(path).absoluteString)
            components?.queryItems = queryParams
            urlRequest.url = components?.url
        case .none:
            break
        }

        return urlRequest
    }
}
