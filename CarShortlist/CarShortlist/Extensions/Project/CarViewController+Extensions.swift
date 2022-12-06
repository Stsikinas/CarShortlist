//
//  CarViewController+Extensions.swift
//  CarShortlist
//
//  Created by Epsilon User on 6/12/22.
//

import Foundation
import UIKit


extension CarViewController {
    
    func setupView() {
        carImageView.load(from: carVM?.carImage.convertToURL, with: .scaleAspectFit)
        carModel.text = carVM?.model
        carDetails.text = carVM?.details
        carPrice.makeAttributed(with: UIImage(systemName: "tag.fill"), colored: UIColor(named: "PrimaryColor"), text: carVM?.price ?? "")
    }
    
}
