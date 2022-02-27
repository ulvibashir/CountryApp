//
//  Countries.swift
//  CountryApp
//
//  Created by Ulvi Bashirov on 25.02.22.
//

import Foundation

public struct Country: Codable {
    public let name: Name?
    public let region, subregion: String?
    public let flags: FlagUrl?
    public let currencies: [String: Currency]?
    public let capital: [String]?
    public let languages: [String: String]?
    public let borders: [String]?
    public let latlng: [Double]?
}

// MARK: - CoatOfArms
public struct FlagUrl: Codable {
    public let png: String?
    public  let svg: String?
}

// MARK: - Maps
public struct Maps: Codable {
    public  let googleMaps, openStreetMaps: String?
}

// MARK: - Name
public struct Name: Codable {
    public let common, official: String?
    public let nativeName: [String: NativeName]?
}

public struct Currency: Codable {
    public let name, symbol: String?
}

public struct NativeName: Codable {
    public let common, official: String?
}
