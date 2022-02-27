//
//  CountryDetailsViewController.swift
//  CountryApp
//
//  Created by Ulvi Bashirov on 27.02.22.
//

import UIKit
import SDWebImage
import NVActivityIndicatorView

class CountryDetailsViewController: UIViewController {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = ColorHelper.textColor.uiColor
        label.font = label.font.withSize(26)
        label.textAlignment = .center
        label.isHidden = true
        label.alpha = 0
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = ColorHelper.textColor.uiColor
        label.font = label.font.withSize(16)
        label.textAlignment = .center
        label.isHidden = true
        label.alpha = 0
        return label
    }()
    
    lazy var flagIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.contentMode = .scaleToFill
        imageView.layer.borderWidth = 1
        imageView.isHidden = true
        imageView.alpha = 0
        return imageView
    }()
    
    lazy var currencyView: CountryItemDetailsView = {
        let view = CountryItemDetailsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        view.alpha = 0
        return view
    }()
    
    lazy var neighborhoodView: CountryItemDetailsView = {
        let view = CountryItemDetailsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        view.alpha = 0
        return view
    }()
    
    lazy var nationalLanguagesView: CountryItemDetailsView = {
        let view = CountryItemDetailsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        view.alpha = 0
        return view
    }()
    
    lazy var activityIndicator: NVActivityIndicatorView = {
        let spinner = NVActivityIndicatorView(
            frame: .init(
                x: (self.view.frame.width / 2) - 24,
                y: (self.view.frame.height / 2) - 24,
                width: 48,
                height: 48),
            type: .ballClipRotateMultiple,
            color: ColorHelper.textColor.uiColor,
            padding: 0)
        return spinner
    }()
    
    lazy var mapButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.isHidden = true
        button.backgroundColor = ColorHelper.textColor.uiColor
        button.setTitleColor(ColorHelper.backgroundColor.uiColor, for: .normal)
        button.setTitle("Show on the map", for: .normal)
        button.alpha = 0
        button.addTarget(self, action: #selector(mapButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func mapButtonTapped() {
        guard viewModel.responseCountry?.latlng?.count == 2,
        let latitude = viewModel.responseCountry?.latlng?[0],
        let longitude = viewModel.responseCountry?.latlng?[1] else { return }
        let vc = CountryMapViewController(latitude: latitude, longitude: longitude)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func saveButtonTapped() {
        viewModel.toggleSelected()
    }
    
    let viewModel: CountryDetailsViewModel = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupChangeHandler()
        viewModel.fetchCountryDetails()
    }
    
    init(with country: String) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel.selectedCountry = country
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .red
        self.view.backgroundColor = ColorHelper.backgroundColor.uiColor
        self.view.addSubview(activityIndicator)
        self.view.addSubview(titleLabel)
        self.view.addSubview(subtitleLabel)
        self.view.addSubview(flagIcon)
        self.view.addSubview(currencyView)
        self.view.addSubview(neighborhoodView)
        self.view.addSubview(nationalLanguagesView)
        self.view.addSubview(mapButton)
        
        self.applyConstraints()
    }
    
    private func setupData() {
        self.titleLabel.text = viewModel.responseCountry?.name?.common
        self.subtitleLabel.text = viewModel.responseCountry?.capital?.first
        self.flagIcon.sd_setImage(
            with: URL(string: viewModel.responseCountry?.flags?.png ?? ""),
            placeholderImage: IconHelper.placeholderImage.uiImage)
        setupCurrency()
        setupNeighborhoods()
        setupNationalLanguages()
        showUI()
    }
    
    private func setupCurrency() {
        let currencies = viewModel.responseCountry?.currencies?.values.map { $0.symbol ?? "" } ?? []
        currencyView.configure(title: "Currency: ", items: currencies)
    }
    
    private func setupNeighborhoods() {
        let neighborhoods = viewModel.responseCountry?.borders ?? []
        neighborhoodView.configure(title: "Border: ", items: neighborhoods)
    }
    
    private func setupNationalLanguages() {
        let languages = viewModel.responseCountry?.languages?.keys.map { $0.uppercased() } ?? []
        nationalLanguagesView.configure(title: "Language: ", items: languages)
    }
    
    private func showUI() {
        flagIcon.isHidden = false
        titleLabel.isHidden = false
        subtitleLabel.isHidden = false
        currencyView.isHidden = false
        neighborhoodView.isHidden = false
        nationalLanguagesView.isHidden = false
        mapButton.isHidden = false
        
        let isSelected = viewModel.isSavedCountry
        navigationItem.rightBarButtonItem?.title = isSelected ? "Remove" : "Save"
        navigationItem.rightBarButtonItem?.tintColor = isSelected ? .red : .blue
        
        UIView.animate(withDuration: 0.3) {
            self.flagIcon.alpha = 1.0
            self.titleLabel.alpha = 1.0
            self.subtitleLabel.alpha = 0.7
            self.currencyView.alpha = 1.0
            self.neighborhoodView.alpha = 1.0
            self.nationalLanguagesView.alpha = 1.0
            self.mapButton.alpha = 1
        }
    }
}

extension CountryDetailsViewController {
    private func setupChangeHandler() {
        viewModel.changeHandler = { [unowned self] change in
            self.changeHandler(change: change)
        }
    }
    
    private func changeHandler(change: CountryDetailsViewState) {
        switch change {
        case .loading:
            activityIndicator.startAnimating()
        case .loaded:
            DispatchQueue.main.async {
                self.setupData()
                self.activityIndicator.stopAnimating()
            }
        case .error:
            self.activityIndicator.stopAnimating()
            ErrorHelper.showAlert(sender: self)
        case .saved:
            navigationItem.rightBarButtonItem?.title = "Remove"
            navigationItem.rightBarButtonItem?.tintColor = .red
        case .removed:
            navigationItem.rightBarButtonItem?.title = "Save"
            navigationItem.rightBarButtonItem?.tintColor = .blue
        }
    }
}
