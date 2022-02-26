//
//  IconHelper.swift
//  CountryApp
//
//  Created by Ulvi Bashirov on 25.02.22.
//

import Foundation
import UIKit

public enum IconHelper: String, CaseIterable, Equatable {
    public var name: String { rawValue }

    case mapIcon
    case searchIcon
    case selectedIcon
    case rightArrowIcon
    case placeholderImage
    
    public var uiImage: UIImage {
        UIImage(named: self.name)!
    }
}

public enum ColorHelper: String, CaseIterable {
    public var name: String { rawValue }
    
    case textColor = "TextColor"
    case backgroundColor = "BackgroundColor"
    
    public var uiColor: UIColor {
        UIColor(named: self.name)!
    }
}
