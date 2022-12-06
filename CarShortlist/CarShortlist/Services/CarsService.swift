//
//  CarsService.swift
//  CarShortlist
//
//  Created by Stavros Tsikinas on 2/12/22.
//

import Foundation
import UIKit

// MARK: - Service Errors
enum ServiceError: Error {
    case NoLinkExists
    case EndpointNotValid
    case EmptyJSON
    case DecodingFailed
    case NoConnection
    case GeneralError
}

// MARK: - Service Protocols
protocol URLConverter {
    func getFileUrl(from endpoint: String) throws -> URL
}

protocol JSONParser {
    func loadJSON(url: String, completion: @escaping(Result<Data, ServiceError>) -> ())
    func parse(data: Data, view: MainViewController?) throws -> [CarViewModel]
}


struct CarsService: URLConverter, JSONParser {
    
    // Got the raw file path
    public let urlLink = "https://raw.githubusercontent.com/beckershoff/Egardia-Mobile-Development-Assessment/master/cars.json"
    
    // MARK: - URLConverter funcs
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
    
    // MARK: - JSONParser funcs
    func loadJSON(url: String, completion: @escaping (Result<Data, ServiceError>) -> Void) {
        do {
            let carsURL = try getFileUrl(from: url)
            let session = URLSession(configuration: .default).dataTask(with: carsURL) { (data, _, error) in
                if let error = error {
                    if error.contains(keyword: "offline") {
                        completion(.failure(.NoConnection))
                    } else {
                        completion(.failure(.GeneralError))
                    }
                }
                if let data = data {
                    completion(.success(data))
                }
            }
            session.resume()
        } catch {
            if let error = error as? ServiceError {
                completion(.failure(error))
            } else {
                completion(.failure(ServiceError.GeneralError))
            }
        }
    }
    
    func parse(data: Data, view: MainViewController? = nil) throws -> [CarViewModel] {
        var viewModels = [CarViewModel]()
        do {
            let carsList = try JSONDecoder().decode([Car].self, from: data)
            if (carsList.isEmpty) {
                throw(ServiceError.EmptyJSON)
            }
            for car in carsList {
                viewModels.append(CarViewModel(car: car, select: {
                    view?.select(car)
                }))
            }
            return viewModels
        } catch {
            throw(ServiceError.GeneralError)
        }
    }
    
    
}
