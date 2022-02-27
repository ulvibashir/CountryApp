//
//  SecondTabViewModel.swift
//  CountryApp
//
//  Created by Ulvi Bashirov on 27.02.22.
//

import Foundation

class SecondTabViewModel {
    lazy var networkHelper: NetworkHelper = .init()
    var changeHandler: ((SecondTabViewState) -> Void)?
    var countries: [Country] = []
    
    var countriesCount: Int {
        countries.count
    }
    
    func fetchCountries(for text: String) {
        self.changeHandler?(.loading)
        networkHelper.fetchRequest(endPoint: .countryDetailURL(country: text)) {
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
