//
//  CarCard.swift
//  CarShortlist
//
//  Created by Stavros Tsikinas on 5/12/22.
//

import UIKit

class CarCard: UITableViewCell {
    
    // MARK: - Subview Initializers
    
    lazy var itemView: UIView = {
        let view = UIView()
        view.cardView(ofRadius: 12.0)
        return view
    }()
    
    lazy var carImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var carModel: UILabel = {
        let label = UILabel()
        label.font = UIFont.kanitFont(size: 15)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    lazy var carPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.kanitFont(size: 13)
        label.textAlignment = .right
        label.textColor = UIColor(named: "PrimaryColor")
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
        
        selectionStyle = .none
        backgroundColor = .clear
        
        addSubview(itemView)
        itemView.addAnchors(wAnchor: widthAnchor, 0.95, hAnchor: heightAnchor, 0.90, cXAnchor: centerXAnchor, cYAnchor: centerYAnchor)
        
        itemView.addSubview(carImage)
        carImage.addAnchors(wAnchor: itemView.widthAnchor, 0.8, cXAnchor: itemView.centerXAnchor, tAnchor: itemView.topAnchor, topConstant: 4, heightConstant: 150)
        itemView.addSubview(carModel)
        carModel.addAnchors(wAnchor: itemView.widthAnchor, 0.75, lAnchor: itemView.leftAnchor, leftConstant: 8, tAnchor: carImage.bottomAnchor, topConstant: 8)
        itemView.addSubview(carPrice)
        carPrice.addAnchors(wAnchor: itemView.widthAnchor, 0.35, tAnchor: carModel.bottomAnchor, topConstant: 14, rAnchor: itemView.rightAnchor, rightConstant: -8, bAnchor: itemView.bottomAnchor, bottomConstant: -12)
        
        
        itemView.layer.borderWidth = 0.35
        itemView.layer.borderColor = UIColor(named: "AccentColor")?.cgColor
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
