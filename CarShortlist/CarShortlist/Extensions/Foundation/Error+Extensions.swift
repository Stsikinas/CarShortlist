//
//  Error+Extensions.swift
//  CarShortlist
//
//  Created by Stavros Tsikinas on 6/12/22.
//

import Foundation


extension Error {
    
    func contains(keyword: String) -> Bool {
        self.localizedDescription.contains(keyword)
    }
    
}
