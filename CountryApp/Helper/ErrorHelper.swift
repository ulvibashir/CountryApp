//
//  ErrorHelper.swift
//  CountryApp
//
//  Created by Ulvi Bashirov on 26.02.22.
//

import Foundation
import UIKit

public class ErrorHelper {
    public static func showAlert(sender: UIViewController) {
        let alert = UIAlertController(
            title: "Error",
            message: "Something Went Wrong",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        sender.present(alert, animated: true, completion: nil)
    }
}
