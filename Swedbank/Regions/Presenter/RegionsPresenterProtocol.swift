//
//  RegionsPresenterProtocol.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import CoreData

/// Presenter of module 'Regions'.
protocol RegionsPresenterProtocol: class {

    var viewController: RegionsViewControllerProtocol! { get set }
    var networkManager: RegionsNetworkManagerProtocol! { get set }
    var storeManager: RegionsStoreManagerProtocol! { get set }
    
    /// Gets 'Fetched Results Controller' from the StoreManager,
    /// sets the ViewController as a delegate, and returns it.
    func makeDataController() -> NSFetchedResultsController<NSFetchRequestResult>

    /// Async downloads and parses data for each country and saves it in the local storage.
    /// - parameter completion: Will perform after all updates are completed.
    func asyncUpdateData(completion: @escaping () -> Void)

}
