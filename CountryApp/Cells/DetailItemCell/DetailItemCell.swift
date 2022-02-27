//
//  DetailItemCell.swift
//  CountryApp
//
//  Created by Ulvi Bashirov on 27.02.22.
//

import UIKit

class DetailItemCell: UICollectionViewCell {
    
    lazy var curvedBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func configure(for title: String) {
        titleLabel.text = title
        setupUI()
    }
    
    private func setupUI() {
        curvedBackgroundView.addSubview(titleLabel)
        self.contentView.addSubview(curvedBackgroundView)
        applyConstraints()
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            curvedBackgroundView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            curvedBackgroundView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
            curvedBackgroundView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            curvedBackgroundView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5),
            
            titleLabel.centerYAnchor.constraint(equalTo: curvedBackgroundView.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: curvedBackgroundView.centerXAnchor)
        ])
    }
}
