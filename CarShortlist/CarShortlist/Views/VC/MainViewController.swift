//
//  ViewController.swift
//  CarShortlist
//
//  Created by Epsilon User on 2/12/22.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Variables
    // Public
    
    // Private
    internal let segueID = "showCar"
    internal let carService = CarsService()
    internal var carsVM = [CarViewModel]()
    internal let cellID = "carCell"
    internal let loading = UIActivityIndicatorView(style: .large)
    internal var carSelected: Car?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createNavigation(with: "Cars Shortlist")
        
        addRefreshButton()
        
        setupTableView()
        
        refreshData()
    }

}

