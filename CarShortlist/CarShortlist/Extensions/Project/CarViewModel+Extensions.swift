//
//  CarViewModel+Extensions.swift
//  CarShortlist
//
//  Created by Epsilon User on 5/12/22.
//

import Foundation

extension CarViewModel {
    
    /// Add a secondary initializer, to help in detail VC
    convenience init(car: Car) {
        self.init(car: car, select: {})
        self.manufacturer = car.make
        self.model = car.model
        if isSafeEmpty(text: car.km) {
            self.details = car.year ?? ""
        } else {
            self.details = makeDetails(det1: car.year ?? "", det2: "\(car.km ?? "")km" )
        }
    }
}
