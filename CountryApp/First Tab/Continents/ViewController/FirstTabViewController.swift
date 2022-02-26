//
//  FirstTabViewController.swift
//  CountryApp
//
//  Created by Ulvi Bashirov on 25.02.22.
//

import UIKit
import NVActivityIndicatorView

class FirstTabViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = ColorHelper.backgroundColor.uiColor
        tableView.register(ContinentCell.self, forCellReuseIdentifier: "\(ContinentCell.self)")
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
    
    let viewModel: FirstTabViewModel = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupChangeHandler()
        viewModel.getContinents()
    }
    
    private func setupUI() {
        self.title = "Continents"
        self.view.backgroundColor = ColorHelper.backgroundColor.uiColor
        self.view.addSubview(tableView)
        self.view.addSubview(activityIndicator)
        self.applyConstraints()
    }
    
}

extension FirstTabViewController {
    private func setupChangeHandler() {
        viewModel.changeHandler = { [unowned self] change in
            self.changeHandler(change: change)
            
        }
    }
    
    private func changeHandler(change: FirstTabViewState.Change) {
        switch change {
        case .loading:
            activityIndicator.startAnimating()
        case .loaded:
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
            }
        case .error:
            ErrorHelper.showAlert(sender: self)
        }
    }
}
