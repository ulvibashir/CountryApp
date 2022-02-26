//
//  ContinentCell.swift
//  CountryApp
//
//  Created by Ulvi Bashirov on 25.02.22.
//

import UIKit

class ContinentCell: UITableViewCell {
    
    public static var height: CGFloat { 54 }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = ColorHelper.textColor.uiColor
        return label
    }()
    
    lazy var rightIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = IconHelper.rightArrowIcon.uiImage
        return imageView
    }()
    
    func configure(for labelText: String) {
        titleLabel.text = labelText
        setupUI()
    }
    
    private func setupUI() {
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(rightIcon)
        self.contentView.backgroundColor = ColorHelper.backgroundColor.uiColor
        self.applyConstraints()
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.rightIcon.leadingAnchor, constant: -16),
            titleLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            
            rightIcon.heightAnchor.constraint(equalToConstant: 20),
            rightIcon.widthAnchor.constraint(equalToConstant: 12),
            rightIcon.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            rightIcon.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20)
        ])
    }
}
