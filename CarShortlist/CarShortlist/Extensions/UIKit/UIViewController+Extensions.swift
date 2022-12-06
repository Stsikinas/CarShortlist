//
//  UIViewController+Extensions.swift
//  CarShortlist
//
//  Created by Stavros Tsikinas on 2/12/22.
//

import Foundation
import UIKit


extension UIViewController {
    
    /// Set navigation title to UIViewController and adjust title color
    internal func createNavigation(with title: String? = "Title") {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = title
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "AccentColor") ?? .white]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "AccentColor") ?? .white]
        navigationItem.largeTitleDisplayMode = .always
        
    }
    
    internal func addButtons(right: [UIBarButtonItem]? = nil, left: [UIBarButtonItem]? = nil) {
            if let right = right {
                navigationItem.setRightBarButtonItems(right, animated: true)
            }
            if let left = left {
                navigationItem.setLeftBarButtonItems(left, animated: true)
            }
        }
    
    internal func showInfoAlert(with message: String) {
        let alert = UIAlertController(title: "Info", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
}
