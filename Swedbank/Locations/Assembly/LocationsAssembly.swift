//
//  LocationsAssembly.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import UIKit

/// Contains and constructs potential entry points for the module "Locations".
class LocationsAssembly {

    /// The default entry point for the module "Locations".
    static func `default`(for region: BankRegion) -> UIViewController {

        let storyboard = UIStoryboard(name: "Locations", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Locations") as!  LocationsTableViewController
        viewController.title = region.name
        viewController.router = LocationsRouter()

        let presenter: LocationsPresenterProtocol = LocationsPresenter()
        presenter.region = region
        
        viewController.presenter = presenter
        return viewController
    }
    
}
