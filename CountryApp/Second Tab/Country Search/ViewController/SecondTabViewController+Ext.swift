//
//  SecondTabViewController+Ext.swift
//  CountryApp
//
//  Created by Ulvi Bashirov on 27.02.22.
//

import Foundation
import UIKit

extension SecondTabViewController: UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard searchText != "" else {
            viewModel.countries = []
            tableView.reloadData()
            return
        }
        NSObject.cancelPreviousPerformRequests(
            withTarget: self,
            selector: #selector(self.sendRequest(_:)),
            object: searchBar
        )
        perform(#selector(self.sendRequest(_:)),
                with: searchBar,
                afterDelay: 0.5)
    }
    
    @objc func sendRequest(_ searchBar: UISearchBar) {
        viewModel.fetchCountries(for: searchBar.text ?? "")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.countriesCount
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CountryCell.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(CountryCell.self)") as! CountryCell
        let data = viewModel.getCountryData(indexPath: indexPath)
        cell.configure(
            title: data.title,
            subtitle: data.subtitle,
            iconUrl: data.iconUrl)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = viewModel.getCountryData(indexPath: indexPath).title
        navigateNext(for: country)
    }
    
    func navigateNext(for country: String) {
        let vc = CountryDetailsViewController(with: country)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SecondTabViewController {
    func applyConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}
