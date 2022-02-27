//
//  ThirdTabViewController.swift
//  CountryApp
//
//  Created by Ulvi Bashirov on 25.02.22.
//

import UIKit
import NVActivityIndicatorView

class ThirdTabViewController: UIViewController {

    lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = ColorHelper.backgroundColor.uiColor
        tableView.register(CountryCell.self, forCellReuseIdentifier: "\(CountryCell.self)")
        tableView.isHidden = true
        tableView.alpha = 0
        return tableView
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
    
    let viewModel: ThirdTabViewModel = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupChangeHandler()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.fetchCountries()
    }
    
    private func setupUI() {
        self.title = "Selected"
        self.view.backgroundColor = ColorHelper.backgroundColor.uiColor
        self.view.addSubview(tableView)
        self.view.addSubview(activityIndicator)
        self.applyConstraints()
    }
    
    private func showUI() {
        tableView.isHidden = false
        UIView.animate(withDuration: 0.3) {
            self.tableView.alpha = 1.0
        }
    }
}

extension ThirdTabViewController {
    private func setupChangeHandler() {
        viewModel.changeHandler = { [unowned self] change in
            self.changeHandler(change: change)
        }
    }
    
    private func changeHandler(change: ThirdTabViewState) {
        switch change {
        case .loading:
            activityIndicator.startAnimating()
        case .loaded:
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.showUI()
                self.activityIndicator.stopAnimating()
            }
        case .error:
            self.activityIndicator.stopAnimating()
            ErrorHelper.showAlert(sender: self)
        }
    }
}




