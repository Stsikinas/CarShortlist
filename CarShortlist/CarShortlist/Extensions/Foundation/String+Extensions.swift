//
//  String+Extensions.swift
//  CarShortlist
//
//  Created by Epsilon User on 5/12/22.
//

import Foundation

extension String {
    
    var toEuros: String {
        "\(self) €"
    }
    
    var convertToURL: URL? {
        URL(string: self)
    }
    
}
