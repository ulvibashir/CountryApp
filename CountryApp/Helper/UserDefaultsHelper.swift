//
//  UserDefaultsHelper.swift
//  CountryApp
//
//  Created by Ulvi Bashirov on 27.02.22.
//

import Foundation

public enum UserDefaultKey: String {
    case selectedCountries = "selectedCountries"
}

class UserDefaultsHelper {
    private let userDefaults: UserDefaults = .standard
    
    public var selectedCountries: [Country] {
        get {
            var result: [Country]? = []
            if let data = UserDefaults.standard.value(forKey: UserDefaultKey.selectedCountries.rawValue) as? Data {
                result = try? PropertyListDecoder().decode([Country].self, from: data)
                return result ?? []
            } else {
                return []
            }
            
        }
        set {
            userDefaults.set(try? PropertyListEncoder().encode(newValue), forKey: UserDefaultKey.selectedCountries.rawValue)
        }
    }
}
