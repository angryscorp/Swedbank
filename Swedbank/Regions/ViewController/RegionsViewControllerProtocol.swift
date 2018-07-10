//
//  RegionsViewControllerProtocol.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import CoreData

/// ViewController of module 'Regions'.
protocol RegionsViewControllerProtocol: class, NSFetchedResultsControllerDelegate {

    var router: RegionsRouterProtocol! { get set }
    var presenter: RegionsPresenterProtocol! { get set }

    /// Shows a text description of the error.
    func showError(_ error: Error)

}
