//
//  UIViewController+Extensions.swift
//  CarShortlist
//
//  Created by Epsilon User on 2/12/22.
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
    
}
