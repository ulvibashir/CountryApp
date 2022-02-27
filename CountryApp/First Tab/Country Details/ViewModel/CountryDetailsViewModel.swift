//
//  CountryDetailsViewModel.swift
//  CountryApp
//
//  Created by Ulvi Bashirov on 27.02.22.
//

import Foundation

class CountryDetailsViewModel {
    lazy var userDefaultsHelper: UserDefaultsHelper = .init()
    lazy var networkHelper: NetworkHelper = .init()
    
    var selectedCountry: String?
    var responseCountry: Country?
    var changeHandler: ((CountryDetailsViewState) -> Void)?
    var isSavedCountry: Bool {
        if let name = responseCountry?.name?.official {
            return userDefaultsHelper.selectedCountries.contains { $0.name?.official == name }
        }
        return false
    }
    
    func fetchCountryDetails() {
        guard let country = selectedCountry else { return }
        
        self.changeHandler?(.loading)
        networkHelper.fetchRequest(endPoint: .countryDetailURL(country: country)) {
            (result: Swift.Result<[Country], NetworkError>) in
            switch result {
            case let .success(response):
                self.responseCountry = response.first
                self.changeHandler?(.loaded)
            case let .failure(error):
                print(error.localizedDescription)
                self.changeHandler?(.error)
            }
        }
    }
    
    func toggleSelected() {
        var savedCountries = userDefaultsHelper.selectedCountries
        
        if let country = responseCountry,
           let name = responseCountry?.name?.official {
            if savedCountries.contains (where: { $0.name?.official == name }) {
                userDefaultsHelper.selectedCountries = savedCountries.filter { $0.name?.official != name }
                changeHandler?(.removed)
            } else {
                savedCountries.append(country)
                userDefaultsHelper.selectedCountries = savedCountries
                changeHandler?(.saved)
            }
        }
    }
}
