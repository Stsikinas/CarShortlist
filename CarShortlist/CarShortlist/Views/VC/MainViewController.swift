//
//  ViewController.swift
//  CarShortlist
//
//  Created by Epsilon User on 2/12/22.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createNavigation(with: "Cars Shortlist")
        
    }


}

