//
//  FirstTabViewModel.swift
//  CountryApp
//
//  Created by Ulvi Bashirov on 25.02.22.
//

import Foundation

class FirstTabViewModel {
    lazy var networkHelper: NetworkHelper = .init()
    private var responseData: ContinentsResponse?
    
    var continentsCount: Int {
        responseData?.continents?.count ?? 0
    }
    
    var changeHandler: ((FirstTabViewState) -> Void)?
    
    public func getContinentData(indexPath: IndexPath) -> String {
        guard let responseData = responseData else { return "" }
        return responseData.continents?[indexPath.row].name ?? ""
    }
    
    public func getContinents() {
        self.changeHandler?(.loading)
        networkHelper.fetchRequest(endPoint: .continentsURL) { (result: Swift.Result<ContinentsResponse, NetworkError>) in
            switch result {
            case let .success(response):
                self.responseData = response
                self.changeHandler?(.loaded)
            case let .failure(error):
                print(error.localizedDescription)
                self.changeHandler?(.error)
            }
        }
    }
}
