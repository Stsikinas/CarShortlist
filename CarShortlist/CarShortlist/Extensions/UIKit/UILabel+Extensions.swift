//
//  UILabel+Extensions.swift
//  CarShortlist
//
//  Created by Stavros Tsikinas on 5/12/22.
//

import Foundation
import UIKit

extension UILabel {
    
    func makeAttributed(with icon: UIImage?, colored: UIColor?, text: String) {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = icon?.withTintColor(colored ?? .systemBlue)
        let imageOffsetY: CGFloat = -5.0
        imageAttachment.bounds = CGRect(x: 0, y: imageOffsetY, width: imageAttachment.image!.size.width, height: imageAttachment.image!.size.height)
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        let attributedText = NSMutableAttributedString(string: "")
        attributedText.append(attachmentString)
        let textAfterIcon = NSAttributedString(string: text)
        attributedText.append(textAfterIcon)
        self.attributedText = attributedText
    }
    
}
