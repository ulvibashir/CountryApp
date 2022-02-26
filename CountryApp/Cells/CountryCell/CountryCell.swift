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
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.textColor = ColorHelper.textColor.uiColor
        label.font = label.font.withSize(15)
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.textColor = ColorHelper.textColor.uiColor
        label.font = label.font.withSize(12)
        label.alpha = 0.7
        return label
    }()
    
    lazy var flagIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = IconHelper.rightArrowIcon.uiImage
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.layer.borderWidth = 1
        return imageView
    }()
    
    lazy var labelStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 2
        return stack
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
        self.labelStackView.addArrangedSubview(titleLabel)
        self.labelStackView.addArrangedSubview(subtitleLabel)
        self.addSubview(labelStackView)
        self.applyConstraints()
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            self.flagIcon.heightAnchor.constraint(equalToConstant: 32),
            self.flagIcon.widthAnchor.constraint(equalToConstant: 50),
            self.flagIcon.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.flagIcon.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
            self.flagIcon.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12),
            
            self.labelStackView.leadingAnchor.constraint(equalTo: self.flagIcon.trailingAnchor, constant: 16),
            self.labelStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.labelStackView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }
}
