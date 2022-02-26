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
}
