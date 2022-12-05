//
//  CarCard+Extensions.swift
//  CarShortlist
//
//  Created by Epsilon User on 5/12/22.
//

import Foundation
import UIKit

extension CarCard {
    internal func configure() {
        carImage.load(from: carViewModel.carImage.convertToURL, with: .scaleAspectFit)
        carModel.text = carViewModel.description
        carPrice.makeAttributed(with: UIImage(systemName: "tag.fill"), text: carViewModel.price)
    }
}
