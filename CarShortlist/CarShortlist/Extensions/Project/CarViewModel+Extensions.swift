//
//  CarViewModel+Extensions.swift
//  CarShortlist
//
//  Created by Epsilon User on 5/12/22.
//

import Foundation

extension CarViewModel {
    
    internal func carDescription(make: String, model: String) -> String {
        "\(make) - \(model)"
    }
    
}

extension CarViewModel {
    
    /// Add a secondary initializer, to help in detail VC
    convenience init(car: Car) {
        self.init(car: car, select: {})
    }
}
