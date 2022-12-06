//
//  CarViewController.swift
//  CarShortlist
//
//  Created by Epsilon User on 6/12/22.
//

import UIKit

class CarViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var carModel: UILabel!
    @IBOutlet weak var carPrice: UILabel!
    @IBOutlet weak var carDetails: UILabel!
    
    
    // MARK: - Variables
    // Public
    public var carVM: CarViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let carVM = carVM else {
            return
        }
        
        createNavigation(with: carVM.manufacturer)
        setupView()
    }

}
