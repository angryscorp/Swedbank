//
//  BankRegion+Additions.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import CoreData

extension BankRegion {

    /// Creates or finds an existing 'Bank Region' based on Region's name and Country's name.
    /// - parameter name: Name of Region.
    /// - parameter country: name of the Country.
    /// - parameter context: Managed object context, where have to work on it.
    static func createIfNeeded(name: String, country: String, into context: NSManagedObjectContext) -> BankRegion {

        // Fetch request for search an existing 'Bank Region'
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BankRegion")
        fetchRequest.predicate = NSPredicate(format: "(name == %@) && (country == %@)", name, country)

        // 'Bank Region', which will be found or created.
        let region: BankRegion

        // If such an object exists, use it, otherwise - create a new one.
        if let results = try? context.fetch(fetchRequest), let bankRegion = results.first as? BankRegion {
            region = bankRegion
        } else {
            region = BankRegion(context: context)
            region.name = name
            region.country = country
        }

        return region
    }

}
