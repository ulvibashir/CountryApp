//
//  CountryCell.swift
//  CountryApp
//
//  Created by Ulvi Bashirov on 26.02.22.
//

import UIKit
import SDWebImage

class CountryCell: UITableViewCell {
    
    public static var height: CGFloat { 56 }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byTruncatingTail
        label.textColor = ColorHelper.textColor.uiColor
        label.font = label.font.withSize(15)
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byTruncatingTail
        label.textColor = ColorHelper.textColor.uiColor
        label.font = label.font.withSize(12)
        label.alpha = 0.7
        return label
    }()
    
    lazy var flagIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    lazy var rightIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = IconHelper.rightArrowIcon.uiImage
        return imageView
    }()
    func configure(title: String, subtitle: String, iconUrl: String) {
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
        self.flagIcon.sd_setImage(
            with: URL(string: iconUrl),
            placeholderImage: IconHelper.placeholderImage.uiImage)
        setupUI()
    }
    
    private func setupUI() {
        self.contentView.backgroundColor = ColorHelper.backgroundColor.uiColor
        self.addSubview(flagIcon)
        self.addSubview(rightIcon)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(subtitleLabel)
        self.applyConstraints()
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            flagIcon.heightAnchor.constraint(equalToConstant: 32),
            flagIcon.widthAnchor.constraint(equalToConstant: 52),
            flagIcon.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            flagIcon.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
            flagIcon.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12),
            
            titleLabel.leadingAnchor.constraint(equalTo: flagIcon.trailingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: rightIcon.leadingAnchor, constant: -16),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: self.flagIcon.trailingAnchor, constant: 16),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            subtitleLabel.trailingAnchor.constraint(equalTo: rightIcon.leadingAnchor, constant: -16),
            
            rightIcon.heightAnchor.constraint(equalToConstant: 16),
            rightIcon.widthAnchor.constraint(equalToConstant: 8),
            rightIcon.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            rightIcon.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20)
        ])
    }
}
