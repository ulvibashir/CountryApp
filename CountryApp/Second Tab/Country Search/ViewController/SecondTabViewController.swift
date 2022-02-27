//
//  SecondTabViewController.swift
//  CountryApp
//
//  Created by Ulvi Bashirov on 25.02.22.
//

import UIKit
import NVActivityIndicatorView

class SecondTabViewController: UIViewController {
    
    lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.searchBarStyle = .minimal
        search.placeholder = "Country"
        search.delegate = self
        return search
    }()
    
    lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = ColorHelper.backgroundColor.uiColor
        tableView.register(CountryCell.self, forCellReuseIdentifier: "\(CountryCell.self)")
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
    
    let viewModel: SecondTabViewModel = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search"
        self.view.backgroundColor = ColorHelper.backgroundColor.uiColor
        setupChangeHandler()
        setupUI()
    }
    
    private func setupUI() {
        self.view.addSubview(searchBar)
        self.view.addSubview(tableView)
        self.view.addSubview(activityIndicator)
        applyConstraints()
    }
}

extension SecondTabViewController {
    private func setupChangeHandler() {
        viewModel.changeHandler = { [unowned self] change in
            self.changeHandler(change: change)
        }
    }
    
    private func changeHandler(change: SecondTabViewState) {
        switch change {
        case .loading:
            activityIndicator.startAnimating()
        case .loaded:
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
            }
        case .error:
            self.activityIndicator.stopAnimating()
        }
    }
}
