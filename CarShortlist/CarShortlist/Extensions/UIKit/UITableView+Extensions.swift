//
//  UITableView+Extensions.swift
//  CarShortlist
//
//  Created by Epsilon User on 5/12/22.
//

import Foundation
import UIKit

extension UITableView {
        
    func addSpinner(loading: UIActivityIndicatorView?) {
        backgroundView = loading
        loading?.startAnimating()
    }
        
    func hideSpinner(loading: UIActivityIndicatorView?) {
        if let loading = loading {
            if loading.isAnimating {
                loading.stopAnimating()
                backgroundView = nil
            }
        }
    }
}
