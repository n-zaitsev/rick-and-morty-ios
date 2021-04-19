//
//  CharacterEndpoint.swift
//  RM
//
//  Created by Импрув on 19.04.2021.
//

import Alamofire
import Foundation

enum CharacterEndpoint: APIConfiguration {
    case getCharactersWithPage(_ page: String)

    var method: HTTPMethod {
        switch self {
        case .getCharactersWithPage:
            return .get
        }
    }

    var path: String {
        switch self {
        case let .getCharactersWithPage(page):
            return RequestURLs.characters + "page=" + page
        }
    }

    var parameters: Parameters? {
        switch self {
        case .getCharactersWithPage:
            return nil
        }
    }

    func asURLRequest() throws -> URLRequest {
        let url = try RequestURLs.baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }

        return urlRequest
    }
}
