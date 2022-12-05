//
//  UITableView+Extensions.swift
//  CarShortlist
//
//  Created by Epsilon User on 5/12/22.
//

import Foundation
import UIKit

extension UITableView {
    
    private var loading: UIActivityIndicatorView {
        get {
            let indicator = UIActivityIndicatorView(style: .medium)
            indicator.color = UIColor(named: "PrimaryColor") ?? .systemBlue
            return indicator
        }
    }
        
    func addSpinner() {
        backgroundView = loading
        loading.startAnimating()
    }
        
    func hideSpinner() {
        if loading.isAnimating {
            loading.stopAnimating()
            backgroundView = nil
        }
    }
}
