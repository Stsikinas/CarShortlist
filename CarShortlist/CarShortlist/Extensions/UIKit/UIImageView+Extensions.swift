//
//  UIImageView+Extensions.swift
//  CarShortlist
//
//  Created by Epsilon User on 5/12/22.
//

import Foundation
import UIKit


extension UIImageView {
        
        func load(from url: URL?, with mode: UIView.ContentMode) {
            
            let activityIndicator = UIActivityIndicatorView()
            
            guard let url = url else {
                image = UIImage(named: "PlaceholderCar")
                contentMode = mode
                return
            }
            
            activityIndicator.color = UIColor(named: "PrimaryColor")
            addSubview(activityIndicator)
            activityIndicator.addAnchors(cXAnchor: centerXAnchor, cYAnchor: centerYAnchor)
            activityIndicator.startAnimating()
            
            URLSession.shared.dataTask(with: url) {  [weak self] data, response, error in
                guard
                    let httpURLResponse = response as? HTTPURLResponse,
                    httpURLResponse.statusCode == 200,
                    let data = data, error == nil,
                    let image = UIImage(data: data) else {
                            // Add placeholder image for corrupt image paths
                            self?.image = UIImage(named: "PlaceholderCar")
                            self?.contentMode = mode
                            return
                    }
                    DispatchQueue.main.async() {
                        self?.image = image
                        self?.contentMode = mode
                        activityIndicator.stopAnimating()
                    }
            }.resume()
            
        }
}
