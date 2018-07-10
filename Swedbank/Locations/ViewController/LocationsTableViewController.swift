//
//  LocationsTableViewController.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import UIKit

/// ViewController of module 'Locations'.
class LocationsTableViewController: UITableViewController, LocationsViewControllerProtocol {

    var router: LocationsRouterProtocol!
    var presenter: LocationsPresenterProtocol!

    /// TableView's Data source: List of 'Bank Location'.
    private lazy var dataSource = presenter.getBankLocations()
    
}

// MARK: TABLE VIEW DATA SOURCE

extension LocationsTableViewController {

    private var reuseID: String { return "cell" }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row].name
        cell.detailTextLabel?.text = dataSource[indexPath.row].address
        return cell
    }

}

// MARK: TABLE VIEW DELEGATE

extension LocationsTableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let location = dataSource[indexPath.row]
        router.goToDetailInfo(for: location, on: self)
    }

}
