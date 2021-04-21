//
//  CharacterEndpoint.swift
//  RM
//
//  Created by Импрув on 19.04.2021.
//

import Alamofire
import Foundation

enum CharacterEndpoint: APIConfiguration {
    case getCharactersWithPage(_ page: String?)

    var method: HTTPMethod {
        switch self {
        case .getCharactersWithPage:
            return .get
        }
    }

    var path: String {
        switch self {
        case .getCharactersWithPage:
            return RequestURLs.characters
        }
    }

    var parameters: Params {
        switch self {
        case let .getCharactersWithPage(page):
            if let page = page {
                return .url([RequestParams.characters.page: page])
            }
            return .body([:])
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
        }

        return urlRequest
    }
}
