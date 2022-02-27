//
//  CountryDetailsViewController+Ext.swift
//  CountryApp
//
//  Created by Ulvi Bashirov on 27.02.22.
//

import Foundation
import UIKit

// MARK: Constraints
extension CountryDetailsViewController {
    func applyConstraints() {
        NSLayoutConstraint.activate([
            flagIcon.heightAnchor.constraint(equalToConstant: 80),
            flagIcon.widthAnchor.constraint(equalToConstant: 130),
            flagIcon.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            flagIcon.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            
            titleLabel.topAnchor.constraint(equalTo: flagIcon.bottomAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            subtitleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),

            currencyView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            currencyView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            currencyView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 10),
            currencyView.heightAnchor.constraint(equalToConstant: 60),

            neighborhoodView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            neighborhoodView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            neighborhoodView.topAnchor.constraint(equalTo: currencyView.bottomAnchor),
            neighborhoodView.heightAnchor.constraint(equalToConstant: 60),

            nationalLanguagesView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            nationalLanguagesView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            nationalLanguagesView.topAnchor.constraint(equalTo: neighborhoodView.bottomAnchor),
            nationalLanguagesView.heightAnchor.constraint(equalToConstant: 60),
            
            mapButton.heightAnchor.constraint(equalToConstant: 50),
            mapButton.widthAnchor.constraint(equalToConstant: 200),
            mapButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            mapButton.topAnchor.constraint(equalTo: nationalLanguagesView.bottomAnchor, constant: 50),
        ])
    }
}

