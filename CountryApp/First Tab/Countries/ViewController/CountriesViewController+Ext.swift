//
//  CountriesViewController+Ext.swift
//  CountryApp
//
//  Created by Ulvi Bashirov on 26.02.22.
//

import Foundation
import UIKit

// MARK: TableView
extension CountriesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.countriesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CountryCell()
        let data = viewModel.getCountryData(indexPath: indexPath)
        cell.configure(
            title: data.title,
            subtitle: data.subtitle,
            iconUrl: data.iconUrl)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CountryCell.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
}
// MARK: Navigation
extension CountriesViewController {
  
}


// MARK: Constraints
extension CountriesViewController {
    func applyConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
