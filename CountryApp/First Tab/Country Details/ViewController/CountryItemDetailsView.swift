//
//  CountryItemDetailsView.swift
//  CountryApp
//
//  Created by Ulvi Bashirov on 27.02.22.
//

import UIKit

class CountryItemDetailsView: UIView {
    
    var items: [String] = []
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = ColorHelper.textColor.uiColor
        label.font = label.font.withSize(14)
        return label
    }()
    
    lazy var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DetailItemCell.self, forCellWithReuseIdentifier: "\(DetailItemCell.self)")
        return collectionView
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        view.alpha = 0.7
        return view
    }()
    
    public init() {
        super.init(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 60))
        setupUI()
    }
    
    public func configure(title: String, items: [String]) {
        self.titleLabel.text = title
        self.items = items
        collectionView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubview(titleLabel)
        self.addSubview(collectionView)
        self.addSubview(lineView)
        applyConstraints()
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),

            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 85),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
            
        ])
    }
}

extension CountryItemDetailsView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "\(DetailItemCell.self)", for: indexPath) as! DetailItemCell
        cell.configure(for: items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.frame.width - (100)) / 3
        return CGSize(width: width, height: 40)
    }
    
}
