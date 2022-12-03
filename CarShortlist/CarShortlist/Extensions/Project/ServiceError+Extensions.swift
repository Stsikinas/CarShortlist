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
            case .EndpointNotValid, .NoLinkExists:
                return "The endpoint provided is not valid. Please make sure the device is online and the endpoint is valid."
            case .DecodingFailed:
                return "There was an error getting your car list. Please contact the support service."
            case .EmptyJSON:
                return "The list is empty."
            default:
                return "A generic error occurred. Please try again later."
        }
    }
    
}
