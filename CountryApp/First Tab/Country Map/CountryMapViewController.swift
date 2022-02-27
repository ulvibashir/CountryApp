//
//  CountryMapViewController.swift
//  CountryApp
//
//  Created by Ulvi Bashirov on 27.02.22.
//

import UIKit
import MapKit

class CountryMapViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    var latitude: Double?
    var longitude: Double?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    lazy var mapView: MKMapView = {
        let view = MKMapView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.mapType = .standard
        view.isZoomEnabled = true
        view.isScrollEnabled = true
        return view
    }()
    
    public init(latitude: Double, longitude: Double) {
        super.init(nibName: nil, bundle: nil)
        self.latitude = latitude
        self.longitude = longitude
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createAnnotation(){
        guard let latitude = latitude, let longitude = longitude else { return }
        
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
        mapView.centerCoordinate = annotation.coordinate;
    }
    
    private func setupUI() {
        self.view.addSubview(mapView)
        self.view.backgroundColor = ColorHelper.backgroundColor.uiColor
        createAnnotation()
        applyConstraints()
    }
    
}

extension CountryMapViewController {
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
