//
//  CountriesViewModel.swift
//  CountryApp
//
//  Created by Ulvi Bashirov on 26.02.22.
//

import Foundation

typealias CountryData = (title: String, subtitle: String, iconUrl: String)

class CountriesViewModel {
    
    let networkHelper: NetworkHelper = .init()
    private var countries: [Country] = []
    var selectedRegion: String?
    
    var countriesCount: Int {
        countries.count
    }
    
    var changeHandler: ((CountriesViewState.Change) -> Void)?
    
    public func fetchCountries() {
        guard let region = selectedRegion else { return }
        
        self.changeHandler?(.loading)
        networkHelper.fetchRequest(endPoint: .countriesURL(region: region)) {
            (result: Swift.Result<[Country], NetworkError>) in
            switch result {
            case let .success(response):
                self.countries = response
                self.changeHandler?(.loaded)
            case let .failure(error):
                print(error.localizedDescription)
                self.changeHandler?(.error)
            }
        }
    }
    
    public func getCountryData(indexPath: IndexPath) -> CountryData {
        guard countries.count > indexPath.row else { return  ("", "", "")}
        
        return (
            title: countries[indexPath.row].name?.common ?? "",
            subtitle: countries[indexPath.row].name?.official ?? "",
            iconUrl: countries[indexPath.row].flags?.png ?? "")
    }
}
