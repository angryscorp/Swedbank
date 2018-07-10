//
//  LocationInfoAssembly.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import UIKit

/// Contains and constructs potential entry points for the module "Location Info".
class LocationInfoAssembly {

    /// The default entry point for the module "Location Info".
    static func `default`(for location: BankLocation) -> UIViewController {

        let storyboard = UIStoryboard(name: "LocationInfo", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "LocationInfo") as!  LocationInfoTableViewController
        viewController.title = location.name

        let presenter: LocationInfoPresenterProtocol = LocationInfoPresenter()
        presenter.location = location

        viewController.presenter = presenter

        return viewController
    }
    
}
