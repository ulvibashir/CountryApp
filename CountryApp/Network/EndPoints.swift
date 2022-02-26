//
//  EndPoints.swift
//  CountryApp
//
//  Created by Ulvi Bashirov on 25.02.22.
//

import Foundation

enum Endpoints {
    case continentsURL
    case countriesURL(region: String)
}

extension Endpoints: EndPointType {
    var path: String {
        switch self {
        case .continentsURL:
            return "https://my-json-server.typicode.com/ulvibashir/DB/db"
        case let .countriesURL(region):
            return "https://restcountries.com/v3.1/region/\(region)"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .continentsURL, .countriesURL:
            return .get
        }
    }
}

public enum HTTPMethod: String {
    case get = "GET"
}

public protocol EndPointType {
    var path: String { get }
    var httpMethod: HTTPMethod { get }
}
