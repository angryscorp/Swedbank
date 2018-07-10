//
//  RegionsTableViewController.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import UIKit
import CoreData

/// ViewController of module 'Regions'.
class RegionsTableViewController: UITableViewController {

    var router: RegionsRouterProtocol!
    var presenter: RegionsPresenterProtocol!

    /// Timer that is used to automatically update information.
    private var timer: Timer!

    /// TableView's Data source: List of 'Bank Location'.
    private lazy var dataSource = presenter.makeDataController()

    // MARK: LIFE CYCLE OF VIEW CONTROLLER

    override func viewDidLoad() {
        super.viewDidLoad()
        onViewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        turnOnTimer()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        turnOffTimer()
    }

}

// MARK: MAIN LOGIC

extension RegionsTableViewController {

    /// Performs the necessary actions on View was loaded.
    private func onViewDidLoad() {
        configUI()
        refreshControl?.refreshManually()
    }

    /// Configs custom UI controls.
    private func configUI() {
        refreshControl = UIRefreshControl()
        refreshControl!.addTarget(self, action: #selector(handlerRefresh), for: .valueChanged)
    }

    /// Refresh Control's handler: starts updating information (with animation).
    @objc private func handlerRefresh(_ refreshControl: UIRefreshControl) {
        presenter.asyncUpdateData(completion: { [unowned self] in self.refreshControl?.endRefreshing() } )
    }

    /// Timer handler: starts updating information (without animation).
    @objc private func handlerTimer() {
        presenter.asyncUpdateData(completion: { } )
    }

    /// Turns on Timer to automatically update information.
    private func turnOnTimer() {
        let interval: TimeInterval = 3600 // 1 hour
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(handlerTimer), userInfo: nil, repeats: true)
    }

    /// Turns off Timer to automatically update information.
    private func turnOffTimer() {
        timer.invalidate()
    }

}

// MARK: TABLE VIEW DATA SOURCE

extension RegionsTableViewController {

    private var reuseCellID: String { return "cell" }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.sections?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.sections?[section].numberOfObjects ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseCellID, for: indexPath)
        if let item = dataSource.object(at: indexPath) as? BankRegion {
            cell.textLabel?.text = item.name
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataSource.sections?[section].name
    }

}

// MARK: TABLE VIEW DELEGATE

extension RegionsTableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let region = dataSource.object(at: indexPath) as? BankRegion else { return }
        router.goToLocations(for: region, on: self)
    }

}

// MARK: REGIONS VIEW CONTROLLER PROTOCOL

extension RegionsTableViewController: RegionsViewControllerProtocol {

    /// Shows a text description of the error.
    func showError(_ error: Error) {
        showMessage(error.localizedDescription)
    }

}

// MARK: FETCHED RESULTS CONTROLLER DELEGATE

extension RegionsTableViewController: NSFetchedResultsControllerDelegate {

    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            guard let indexPath = newIndexPath else { return }
            tableView.insertRows(at: [indexPath], with: .automatic)
        case .update:
            guard let indexPath = indexPath else { return }
            tableView.reloadRows(at: [indexPath], with: .automatic)
        case .move:
            guard let indexPath = indexPath, let newIndexPath = newIndexPath else { return }
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        case .delete:
            guard let indexPath = indexPath else { return }
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        switch type {
        case .insert:
            tableView.insertSections([sectionIndex], with: .automatic)
        case .delete:
            tableView.deleteSections([sectionIndex], with: .automatic)
        case .update, .move:
            tableView.reloadSections([sectionIndex], with: .automatic)
        }
    }

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }

}
