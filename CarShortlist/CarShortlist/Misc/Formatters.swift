//
//  Formatters.swift
//  CarShortlist
//
//  Created by Epsilon User on 6/12/22.
//

import Foundation

public func makeDetails(det1: String, det2: String) -> String {
    var detailText = ""
    if !det1.isEmpty {
        detailText.append(det1)
        if !det2.isEmpty {
            detailText.append(" - ")
        }
    }
    if !det2.isEmpty {
        detailText.append(det2)
    }
    
    return detailText
}

public func isSafeEmpty(text: String?) -> Bool {
    
    guard let text = text else {
        return true
    }
    
    return text.isEmpty
}
