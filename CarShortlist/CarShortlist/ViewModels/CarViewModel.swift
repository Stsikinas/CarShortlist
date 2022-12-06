//
//  CarViewModel.swift
//  CarShortlist
//
//  Created by Epsilon User on 5/12/22.
//

import Foundation

class CarViewModel {
    
    let carImage: String
    var description: String
    let price: String
    let select: () -> Void?
    let year: String?
    let kms: String?
    
    // MARK: - Initializers
    init(car: Car, select: @escaping () -> Void) {
        self.carImage = car.picture ?? ""
        self.description = ""
        self.price = car.price?.toEuros ?? "0".toEuros
        self.select = select
        self.year = car.year
        self.kms = car.km
        self.description = carDescription(make: car.make ?? "", model: car.model ?? "")
    }
    
}
