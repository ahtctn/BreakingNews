//
//  Endpoint.swift
//  BreakingNews
//
//  Created by Ahmet Ali ÇETİN on 21.07.2023.
//

import Foundation

protocol EndpointProtocol {
    
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
    
    func request() -> URLRequest
}

enum Endpoint {
    case getTopHeadlines(country: String, category: String, apiKey: String)
    case getEverything(q: String, apiKey: String)
}

extension Endpoint: EndpointProtocol {
    var baseURL: String {
        return Constants.baseURL
    }
    
    var path: String {
        switch self {
        case .getTopHeadlines:
            return Constants.pathGetTopHeadlines
        case .getEverything:
            return Constants.pathGetEverything
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .getTopHeadlines(let country, let category, let apiKey):
            return ["country": country, "category": category,  "apiKey": apiKey]
        case .getEverything(let q, let apiKey):
            return ["q": q, "apiKey": apiKey]
        }
    }
    
    func request() -> URLRequest {
        guard var components = URLComponents(string: baseURL + path) else {
            fatalError("Unable to use components")
        }
        
        components.path = path
        if let parameters = parameters {
            components.queryItems = parameters.map { key, value in
                URLQueryItem(name: key, value: "\(value)")
            }
        }
        
        guard let url = components.url else { fatalError("Wrong url")}
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if let headers = headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        return request
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case patch = "PATCH"
    case delete = "DELETE"
}
