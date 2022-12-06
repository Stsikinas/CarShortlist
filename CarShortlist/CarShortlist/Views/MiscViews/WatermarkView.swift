//
//  WatermarkView.swift
//  CarShortlist
//
//  Created by Stavros Tsikinas on 6/12/22.
//

import UIKit

class WatermarkView: UIView {

    // MARK: - Subivew Initializers
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.kanitFont(size: 16)
        label.textColor = UIColor(named: "PrimaryColor")
        label.textAlignment = .center
        label.sizeToFit()
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var imageview: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        // For testing purposes
        imageView.accessibilityIdentifier = "watermarkImage"
        return imageView
    }()
    
        
    // MARK: - Initializers
    init(frame: CGRect, with text: String, image: UIImage) {
        super.init(frame: frame)
        
        imageview.image = image.withTintColor(UIColor(named: "PrimaryColor") ?? .darkGray)
        title.text = text
        
        addSubview(imageview)
        imageview.addAnchors(cXAnchor: centerXAnchor, cYAnchor: centerYAnchor)
        addSubview(title)
        title.addAnchors(wAnchor: widthAnchor, 0.8, cXAnchor: centerXAnchor, tAnchor: imageview.bottomAnchor,topConstant: 8)
        
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
