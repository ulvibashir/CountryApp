//
//  ThirdTabViewController+Ext.swift
//  CountryApp
//
//  Created by Ulvi Bashirov on 27.02.22.
//


import Foundation
import UIKit

extension ThirdTabViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.countriesCount
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CountryCell.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateNext(for: viewModel.getCountryData(indexPath: indexPath).title)
    }
    
    func navigateNext(for country: String) {
        let vc = CountryDetailsViewController(with: country)
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: Constraints
extension ThirdTabViewController {
    func applyConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
