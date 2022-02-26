//
//  MainViewController.swift
//  CountryApp
//
//  Created by Ulvi Bashirov on 25.02.22.
//

import UIKit

class MainViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.viewControllers = [
            createFirstTab(),
            createSecondTab(),
            createThirdTab()
        ]
    }
    
    private func createFirstTab() -> UIViewController {
        let tab = FirstTabViewController()
        let navBar = UINavigationController(rootViewController: tab)
        let tabBarItem = UITabBarItem(
            title: "Continents",
            image: IconHelper.mapIcon.uiImage,
            tag: 0)
        
        tab.tabBarItem = tabBarItem
        navBar.navigationBar.prefersLargeTitles = true
        
        return navBar
    }
    
    private func createSecondTab() -> UIViewController {
        let tab = SecondTabViewController()
        let tabBarItem = UITabBarItem(
            title: "Search",
            image: IconHelper.searchIcon.uiImage,
            tag: 1)
        tab.tabBarItem = tabBarItem
        
        return tab
    }
    
    private func createThirdTab() -> UIViewController {
        let tab = ThirdTabViewController()
        let tabBarItem = UITabBarItem(
            title: "Selected",
            image: IconHelper.selectedIcon.uiImage,
            tag: 2)
        tab.tabBarItem = tabBarItem
        
        return tab
    }
}

