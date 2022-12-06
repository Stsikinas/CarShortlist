//
//  UIFont+Extensions.swift
//  CarShortlist
//
//  Created by Epsilon User on 6/12/22.
//

import Foundation
import UIKit


extension UIFont {
    static func kanitFont(size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: "Kanit-Regular", size: size) else {
            return .systemFont(ofSize: size)
        }
        return customFont
    }
}
