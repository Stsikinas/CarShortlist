//
//  CarCard.swift
//  CarShortlist
//
//  Created by Epsilon User on 5/12/22.
//

import UIKit

class CarCard: UITableViewCell {
    
    // MARK: - Subview Initializers
    lazy var carImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var carModel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    lazy var carPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .heavy)
        label.textAlignment = .left
        label.textColor = .lightText
        label.numberOfLines = 0
        return label
    }()
    
    var carViewModel: CarViewModel! {
        didSet {
            configure()
        }
    }
    

    // MARK: - Class Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cardView(ofRadius: 12.0)
        
        addSubview(carImage)
        carImage.addAnchors(wAnchor: widthAnchor, 0.8, hAnchor: heightAnchor, 0.5, cXAnchor: centerXAnchor, tAnchor: topAnchor, topConstant: 4)
        addSubview(carModel)
        carModel.addAnchors(wAnchor: widthAnchor, 0.75, lAnchor: leftAnchor, leftConstant: 8, tAnchor: carImage.bottomAnchor, topConstant: 8)
        addSubview(carPrice)
        carPrice.addAnchors(wAnchor: widthAnchor, 0.75, tAnchor: carModel.bottomAnchor, topConstant: 14, rAnchor: rightAnchor, rightConstant: 4, bAnchor: bottomAnchor, bottomConstant: -12)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
