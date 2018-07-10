//
//  RegionsAssembly.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import UIKit

/// Contains and constructs potential entry points for the module "Regions".
class RegionsAssembly {

    /// The default entry point for the module "Regions".
    static func `default`() -> UIViewController {

        let storyboard = UIStoryboard(name: "Regions", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Regions") as! RegionsTableViewController
        viewController.router = RegionsRouter()

        let storeManager: RegionsStoreManagerProtocol = RegionsStoreManager()
        storeManager.coreDataStack = CoreDataStack.shared

        let presenter: RegionsPresenterProtocol = RegionsPresenter()
        presenter.networkManager = RegionsNetworkManager()
        presenter.storeManager = storeManager
        presenter.viewController = viewController

        viewController.presenter = presenter

        return viewController
    }

}
