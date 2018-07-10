//
//  RegionsStoreManager.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import CoreData

/// Store Manager of module 'Regions'.
class RegionsStoreManager: RegionsStoreManagerProtocol {

    var coreDataStack: CoreDataStackProtocol!

    /// Saves data about 'Bank Locations' from the JSON-data.
    /// If an object already exists, it will only be updated.
    /// Otherwise, a new one will be created.
    /// Non-actual objects will be deleted.
    /// - parameter locations: JSON-data array for 'Bank Location'.
    /// - parameter countryName: Country's name for which is needed to save this data.
    func save(_ locations: [BankLocationJSON], for countryName: String) {

        coreDataStack.persistentContainer.performBackgroundTask({ (context) in

            // Array of actual objects 'Bank Location'.
            var actualObjects = [BankLocation]()

            // Create or update data for all actual objects.
            locations.forEach {
                guard let bankLocation = BankLocation.createIfNeeded(from: $0, with: countryName, into: context) else { return }
                actualObjects.append(bankLocation)
            }

            // Delete non-actual objects for current country, if they are.
            let fetchRequestLocations = NSFetchRequest<NSFetchRequestResult>(entityName: "BankLocation")
            fetchRequestLocations.predicate = NSPredicate(format: "!(SELF in %@) AND (region.country == %@)", actualObjects, countryName)
            if let fetchResults = try? context.fetch(fetchRequestLocations) {
                fetchResults.forEach { context.delete($0 as! NSManagedObject) }
            }

            // Delete empty (without any 'Bank Location') 'Bank Region', if they are.
            let fetchRequestRegions = NSFetchRequest<NSFetchRequestResult>(entityName: "BankRegion")
            fetchRequestRegions.predicate = NSPredicate(format: "(locations.@count == 0) AND (country == %@)", countryName)
            if let fetchResults = try? context.fetch(fetchRequestRegions) {
                fetchResults.forEach { context.delete($0 as! NSManagedObject) }
            }

            // Saving all changes.
            do { try context.save() }
            catch { assertionFailure("Error Save Background Context: RegionsStoreManager.save. " + error.localizedDescription) }
        })
        
    }

    /// Constructs and returns 'Fetched Results Controller' for 'Bank Region' grouped by Country's name.
    /// All data is sorted alphabetically (both, sections and rows).
    func makeResultsController() -> NSFetchedResultsController<NSFetchRequestResult> {

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BankRegion")
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "country", ascending: true),
            NSSortDescriptor(key: "name", ascending: true)
        ]

        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: coreDataStack.persistentContainer.viewContext, sectionNameKeyPath: #keyPath(BankRegion.country), cacheName: nil)

        do { try fetchedResultsController.performFetch() }
        catch { assertionFailure("Error Perform Fetch Result Controller: RegionsStoreManager.getResultsController") }

        return fetchedResultsController
    }

}
