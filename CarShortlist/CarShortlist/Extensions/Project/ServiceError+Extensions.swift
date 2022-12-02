//
//  ServiceError+Extensions.swift
//  CarShortlist
//
//  Created by Epsilon User on 2/12/22.
//

import Foundation

extension ServiceError {
    
    var getDescription: String {
        switch self {
            case .EndpointNotValid:
                return "The endpoint provided is not valid. Please make sure the device is online and the endpoint is valid."
            default:
                return "A generic error occurred. Please try again later."
        }
    }
    
}
