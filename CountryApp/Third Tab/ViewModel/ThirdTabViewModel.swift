//
//  ThirdTabViewModel.swift
//  CountryApp
//
//  Created by Ulvi Bashirov on 27.02.22.
//

import Foundation

class ThirdTabViewModel {
    lazy var userDefaultsHelper: UserDefaultsHelper = .init()
    lazy var networkHelper: NetworkHelper = .init()
    private var countries: [Country] = []
    
    var countriesCount: Int {
        countries.count
    }
    
    var changeHandler: ((ThirdTabViewState) -> Void)?
    
    public func fetchCountries() {
        self.countries = userDefaultsHelper.selectedCountries
        changeHandler?(.loaded)
    }
    
    public func getCountryData(indexPath: IndexPath) -> CountryData {
        guard countries.count > indexPath.row else { return  ("", "", "")}
        
        let title = countries[indexPath.row].name?.common ?? ""
        let subtitle = countries[indexPath.row].name?.nativeName?.first?.value.common ?? ""
        
        return (
            title: title,
            subtitle: subtitle,
            iconUrl: countries[indexPath.row].flags?.png ?? "")
    }
}
