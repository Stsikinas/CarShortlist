//
//  CarViewModel.swift
//  CarShortlist
//
//  Created by Epsilon User on 5/12/22.
//

import Foundation

class CarViewModel {
    
    let carImage: String
    let price: String
    // List View
    var description: String?
    let select: () -> Void?
    // Detail View
    var manufacturer: String?
    var model: String?
    var details: String?
    
    // MARK: - Initializers
    init(car: Car, select: @escaping () -> Void) {
        self.carImage = car.picture ?? ""
        self.price = car.price?.toEuros ?? "0".toEuros
        self.select = select
        self.description = makeDetails(det1: car.make ?? "", det2: car.model ?? "")
    }
    
}
