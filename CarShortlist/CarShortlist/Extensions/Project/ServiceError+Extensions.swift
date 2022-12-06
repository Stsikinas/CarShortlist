//
//  ServiceError+Extensions.swift
//  CarShortlist
//
//  Created by Stavros Tsikinas on 2/12/22.
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
            case .NoConnection:
                return "You appear to be offline. Please  make sure the device is online and try again."
            default:
                return "A generic error occurred. Please try again later."
        }
    }
    
}
