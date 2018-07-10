//
//  LocationInfoTableViewController.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import UIKit

/// ViewController of module 'Location Info'.
class LocationInfoTableViewController: UITableViewController, LocationInfoTableViewControllerProtocol {

    var presenter: LocationInfoPresenterProtocol!

    /// Detail info for current 'Bank Location'.
    private lazy var locationInfo = presenter.makeDetailInfo()

    /// TableView's Data source: presents detailed information in two sections:
    /// - first section: main information;
    /// - second section: additional information (optional).
    private var dataSource: [[LocationInfoViewModel.InfoRowTable]] {
        return [locationInfo.mainInfoTableView, locationInfo.additionalInfoTableView]
    }
    
}

// MARK: TABLE VIEW DATA SOURCE

extension LocationInfoTableViewController {

    private var reuseID: String { return "cell" }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = dataSource[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath)
        cell.textLabel?.text = info.title
        cell.detailTextLabel?.text = info.value
        return cell
    }

}
