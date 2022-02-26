//
//  Continents.swift
//  CountryApp
//
//  Created by Ulvi Bashirov on 25.02.22.
//

import Foundation

public struct ContinentsResponse: Codable {
    let continents: [Continent]?
}

public struct Continent: Codable {
    let name: String?
}

