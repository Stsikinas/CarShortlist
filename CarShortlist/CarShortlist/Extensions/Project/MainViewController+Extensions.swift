//
//  MainViewController+Extensions.swift
//  CarShortlist
//
//  Created by Epsilon User on 2/12/22.
//

import Foundation
import UIKit


extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    /// Add initial properties to the tableview, for presentation purposes
    internal func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    
}
