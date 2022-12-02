//
//  CarsService.swift
//  CarShortlist
//
//  Created by Epsilon User on 2/12/22.
//

import Foundation
import UIKit

// MARK: - Service Errors
enum ServiceError: Error {
    case NoLinkExists
    case EndpointNotValid
    case GeneralError
}

// MARK: - Service Protocols
protocol URLConverter {
    func getFileUrl(from endpoint: String) throws -> URL
}


struct CarsService: URLConverter {
    
    private let fileUrl = "https://github.com/beckershoff/Egardia-Mobile-Development-Assessment/blob/master/cars.json"
    
    func getFileUrl(from endpoint: String) throws -> URL {
        guard let url = URL(string: endpoint) else {
            throw(ServiceError.NoLinkExists)
        }
        
        // Check if url is valid
        if !UIApplication.shared.canOpenURL(url) {
            throw(ServiceError.EndpointNotValid)
        } else {
            return url
        }
    }
    
    
}
