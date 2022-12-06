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
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(CarCard.self, forCellReuseIdentifier: cellID)
        loading.color = UIColor(named: "PrimaryColor") ?? .systemBlue
    }
    
    // MARK: - UITableView funcs
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        carsVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? CarCard else {
            return UITableViewCell()
        }
        cell.carViewModel = carsVM[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let carVM = carsVM[indexPath.row]
        carVM.select()
    }
    
}

extension MainViewController {
    
    // MARK: - Update funcs
    internal func refreshData() {
        tableView.addSpinner(loading: loading)
        DispatchQueue.global().async { [weak self] in
            self?.carService.loadJSON(url: self?.carService.urlLink ?? "") { result in
                switch result {
                case .success(let data):
                    do {
                        self?.carsVM = try self?.carService.parse(data: data, view: self) ?? []
                        DispatchQueue.main.async {
                            self?.tableView.hideSpinner(loading: self?.loading)
                            self?.tableView.reloadData()
                        }
                    } catch {
                        DispatchQueue.main.async {
                            self?.tableView.hideSpinner(loading: self?.loading)
                        }
                    }
                    break
                case .failure(let error):
                    DispatchQueue.main.async {
                        self?.tableView.hideSpinner(loading: self?.loading)
                        self?.showInfoAlert(with: error.getDescription)
                    }
                    break
                }
            }
        }
    }
    
    
}

extension MainViewController {
    
    public func select(_ car: Car) {
        carSelected = car
        performSegue(withIdentifier: segueID, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueID {
            if let destVC = segue.destination as? CarViewController,
               let car = carSelected
            {
                destVC.carVM = CarViewModel(car: car)
            }
        }
    }
    
}
